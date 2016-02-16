%%%-------------------------------------------------------------------
%% @doc dorayaki top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module('dorayaki_sup').

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    config_loader:load_config(),
    {ok, CLIENT_PORT} = application:get_env(dorayaki, client_port),

    lager:log(debug, "console", "CLIENT_PORT at start_link ~p", [CLIENT_PORT]),
    supervisor:start_link({local, ?SERVER}, ?MODULE, [CLIENT_PORT]).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

init([CLIENT_PORT]) ->
    RestartStrategy = one_for_one,
    MaxRestarts = 3,
    MaxSecondsBetweenRestarts = 3600,
 
    SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},
 
    Restart = permanent,
    Shutdown = 2000,
    Type = worker,

    AChild = {dorayaki_client, {dorayaki_client, start, [CLIENT_PORT]},
          Restart, Shutdown, Type, [dorayaki_client]},
 
    {ok, {SupFlags, [AChild]}}.
    
%%====================================================================
%% Internal functions
%%====================================================================
