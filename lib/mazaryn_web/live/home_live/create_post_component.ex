defmodule MazarynWeb.HomeLive.CreatePostComponent do
  use MazarynWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="flex flex-col justify-between align-center py-5">
        <div class="flex items-center px-5">
            <img class="h-11 w-11 rounded-full" src="https://placeimg.com/192/192/people" />
            <div class="ml-4 text-sm leading-tight">
                <span class="text-gray-300 font-normal block" contenteditable>Write a comment</span>
            </div>
        </div>
        <div class="flex flex-row justify-between items-center pt-10 px-5">
            <div class="flex flex-row items-center">
                <i>
                    <%= Heroicons.icon("emoji-happy", class: "h-5 w-5 mr-3 fill-gray-500" ) %>
                </i>
                <i>
                    <%= Heroicons.icon("hashtag", class: "h-5 w-5 mr-3 fill-gray-500" ) %>
                </i>
                <i>
                    <%= Heroicons.icon("photograph", class: "h-5 w-5 mr-3 fill-gray-500" ) %>
                </i>
                <div class="relative inline-block text-left">
                    <div>
                        <button phx-click={Phoenix.LiveView.JS.toggle(to: ".dropdown-menu-globe" , in: "fade-in-scale" ,
                            out: "fade-out-scale" )} type="button"
                            class="dropdown inline-flex justify-center w-full rounded-md border border-slate-100 shadow-sm px-4 py-1.5 bg-slate-100 text-sm font-medium text-gray-700 flex-shrink-0 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"
                            id="menu-button" aria-expanded="true" aria-haspopup="true">
                            <div class="rounded-full  flex-shrink-0">
                                <i>
                                    <%= Heroicons.icon("globe", class: "h-5 w-5 mr-3 fill-gray-500" ) %>
                                </i>
                            </div>
                            everyone
                            <svg class="-mr-1 ml-2 h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                fill="currentColor" aria-hidden="true">
                                <path fill-rule="evenodd"
                                    d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                    clip-rule="evenodd" />
                            </svg>
                        </button>
                    </div>
                    <div class="dropdown-menu-globe hidden origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 divide-y divide-gray-100 focus:outline-none"
                        role="menu" aria-orientation="vertical" aria-labelledby="menu-button" tabindex="-1">
                        <div class="py-1" role="none">
                            <a href="#" class="text-gray-700 block px-4 py-2 text-sm hover:bg-gray-100" role="menuitem"
                                tabindex="-1" id="menu-item-0">
                                <div class="flex">
                                    <div class="flex rounded-full pr-6">
                                        <i>
                                            <%= Heroicons.icon("user", class: "h-5 w-5 fill-gray-500" ) %>
                                        </i>
                                    </div>
                                    <h1>public</h1>
                                </div>
                            </a>
                            <a href="#" class="text-gray-700 block px-4 py-2 text-sm hover:bg-gray-100" role="menuitem"
                                tabindex="-1" id="menu-item-0">
                                <div class="flex">
                                    <div class="flex rounded-full pr-6">
                                        <i>
                                            <%= Heroicons.icon("user", class: "h-5 w-5 fill-gray-500" ) %>
                                        </i>
                                    </div>
                                    <h1>public</h1>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <button class="bg-blue-600 text-white border rounded-lg py-1.5 px-6 mx-5 self-auto">Post</button>
            </div>
        </div>
    </div>
    """
  end
end
