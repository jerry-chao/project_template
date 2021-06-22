%%%-------------------------------------------------------------------
%% @doc {{name}} public API
%% @end
%%%-------------------------------------------------------------------

-module({{name}}_app).

-behaviour(application).

-export([start/2, stop/1]).

-export([update_routes/0, routes/0]).

start(_StartType, _StartArgs) ->
    case application:get_env({{name}}, ensable_route, false) of
        true ->
            Dispatch = cowboy_router:compile(routes()),
            {ok, _} = cowboy:start_clear(
                        web_http_listener,
                        [{port, 80}],
                        #{env => #{dispatch => Dispatch}}
                       );
        false ->
            ignore
    end,
    {{name}}_sup:start_link().

stop(_State) ->
    ok.

update_routes() ->
    Dispatch = cowboy_router:compile(routes()),
    cowboy:set_env(web_http_listener, dispatch, Dispatch).

routes() ->
    [{'_', [{"/", {{name}}_handler, []}]}].

%% internal functions
