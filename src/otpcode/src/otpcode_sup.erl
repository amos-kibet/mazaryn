%%%-------------------------------------------------------------------
%% @doc otpcode top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(otpcode_sup).

-include("records.hrl").

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    % create schema and directory
    application:set_env(mnesia, dir, "Mnesia/"),
    mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:change_table_copy_type(schema, node(), disc_copies),

    %% enable httpc
    ssl:start(),
    application:start(inets),
    %% create ETS table to store user_reg process
    ets:new(user_reg, [set, named_table, public]),

    % create tables
    mnesia:create_table(post, [{attributes, record_info(fields, post)},
                               {disc_copies, [node()]},
                               {type, ordered_set}]),

    mnesia:create_table(notification, [{attributes, record_info(fields, notification)},
                                       {disc_copies, [node()]},
                                       {type, ordered_Set}]),

    mnesia:create_table(user, [{attributes, record_info(fields, user)},
                               {disc_copies, [node()]},
                               {type, ordered_set}]),

    % create index key for user -> username
    mnesia:add_table_index(user, username),

    mnesia:create_table(comment, [{attributes, record_info(fields, comment)},
                               {disc_copies, [node()]},
                               {type, ordered_set}]),

    mnesia:add_table_index(user, email),

    supervisor:start_link({local, ?SERVER}, ?MODULE, []).


init([]) ->
    SupFlags = #{strategy => one_for_one,
                 intensity => 50,
                 period => 1},
    ChildSpecs = [
                  #{id => user_server,
                    start => {user_server, start_link, []},
                    restart => permanent,
                    shutdown => 5000,
                    type => worker,
                    modules => [user_server]},

                  #{id => post_server,
                    start => {post_server, start_link, []},
                    restart => permanent,
                    shutdown => 5000,
                    type => worker,
                    modules => [post_server]},

                  #{id => notif_server,
                    start => {notif_server, start_link, []},
                    restart => permanent,
                    shutdown => 5000,
                    type => worker,
                    modules => [notif_server]},

                  #{id => token_server,
                    start => {token_server, start_link, []},
                    restart => permanent,
                    shutdown => 5000,
                    type => worker,
                    modules => [token_server]}

                  ],
    {ok, {SupFlags, ChildSpecs}}.

%% internal functions
