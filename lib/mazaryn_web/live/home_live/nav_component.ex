defmodule MazarynWeb.HomeLive.NavComponent do
  use MazarynWeb, :live_component

  def render(assigns) do
    ~H"""
    <!-- navigation -->
        <nav class="flex justify-evenly items-center w-full bg-white relative text-center px-9 py-3 shadow-lg">
            <div class="text-xl font-extrabold text-black cursor-pointer flex-shrink-0">
                <img src={Routes.static_path(@socket, "/images/logo.png")} alt="Mazaryn Logo"/>
            </div>
            <div class="flex m-auto my-0 h-9 leading-9 w-1/2 px-10">
                <input type="search" placeholder="Search" class="w-full text-sm outline-0 rounded border-2 border-slate-200 bg-slate-100"/>
                <span class="fa fa-search"></span>
            </div>
            <ol class="hidden md:flex justify-evenly items-center list-none">
                <li class="mx-5 my-0">
                    <div class="flex justify-evenly items-center px-5 py-1 bg-slate-100 rounded-full">
                        <div class="rounded-full pr-4 flex-shrink-0">
                            <img src={Routes.static_path(@socket, "/images/mazaryn-symbol.svg")} alt="Mazaryn symbol" class="w-4 rounded-full"/>
                        </div>

                        <h1>0.23</h1>
                    </div>
                </li>
                <li class="mx-5 my-0">
                    <div class="w-8 h-8 bg-slate-100 center rounded-full p-1">
                        <span class="relative inline-block">
                            <svg class="w-6 rounded-full text-gray-200" width="20" height="20" viewBox="0 0 29 29" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M24.3112 20.5829L21.7378 16.9417V9.82806C21.7378 6.19728 19.0505 3.18269 15.5605 2.66783V1.06099C15.5605 0.475045 15.0855 0 14.4996 0C13.9137 0 13.4386 0.475045 13.4386 1.06099V2.66777C9.94864 3.18264 7.26133 6.19722 7.26133 9.828V16.9417L4.68797 20.5829C4.19259 21.2837 4.69426 22.2562 5.55435 22.2562H23.4449C24.3031 22.2563 24.8077 21.2852 24.3112 20.5829Z" fill="#AAAAAA"/>
                                <path d="M14.4989 23.0137C12.8485 23.0137 11.5059 24.3563 11.5059 26.0067C11.5059 27.6571 12.8486 28.9998 14.4989 28.9998C16.1493 28.9998 17.4919 27.6571 17.4919 26.0068C17.4919 24.3564 16.1493 23.0137 14.4989 23.0137Z" fill="#AAAAAA"/>
                            </svg>
                            <span class="absolute top-0 left-5 px-1.5 py-1 text-xs font-bold leading-none text-red-100 transform bg-red-600 rounded-full">9</span>
                        </span>
                    </div>
                </li>
                <li class="mx-5 my-0">
                    <div class="relative inline-block text-left">
                        <div>
                            <button phx-click={Phoenix.LiveView.JS.toggle(to: ".dropdown-menu", in: "fade-in-scale", out: "fade-out-scale")} type="button" class="dropdown inline-flex justify-center w-full rounded-md border border-slate-100 shadow-sm px-4 py-1.5 bg-slate-100 text-sm font-medium text-gray-700 flex-shrink-0 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500" id="menu-button" aria-expanded="true" aria-haspopup="true">
                                <div class="rounded-full pr-6 flex-shrink-0">
                                    <img src="https://placeimg.com/192/192/people" class="w-6 rounded-full"/>
                                </div>
                                <%= @user_id %>
                                <svg class="-mr-1 ml-2 h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                                </svg>
                            </button>
                        </div>
                        <div class="dropdown-menu hidden origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 divide-y divide-gray-100 focus:outline-none"  role="menu" aria-orientation="vertical" aria-labelledby="menu-button" tabindex="-1">
                            <div class="py-1" role="none">
                                <a href="#" class="text-gray-700 block px-4 py-2 text-sm" role="menuitem" tabindex="-1" id="menu-item-0">
                                    <div class="flex">
                                        <div class="flex rounded-full pr-6">
                                            <img src="https://placeimg.com/192/192/people" class="w-8 rounded-full"/>
                                        </div>
                                        <div class="flex flex-col">
                                            <h1><%= @user_id %></h1>
                                            <span class="text-xs text-gray-500"><%= @user_id %></span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="py-1" role="none">
                                <%= link "Log Out", to: Routes.logout_path(@socket, :index), class: "text-gray-700 block px-4 py-2 text-sm", role: "menuitem", tabindex: "-1", id: "menu-item-6"  %>
                            </div>
                        </div>
                    </div>
                </li>
            </ol>
            <!-- Mobile menu button -->
            <div class="md:hidden flex items-center">
                <button  phx-click={Phoenix.LiveView.JS.toggle(to: ".mobile-menu", in: "fade-in-scale", out: "fade-out-scale")} class="outline-none mobile-menu-button">
                    <svg
                        class="w-6 h-6 text-gray-500"
                        x-show="!showMenu"
                        fill="none"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                        >
                        <path d="M4 6h16M4 12h16M4 18h16"></path>
                    </svg>
                </button>
            </div>

        </nav>
        <!-- Mobile menu -->
        <div class="hidden md:hidden mobile-menu">
            <ul class="">
                <li class="active"><a href="index.html" class="block text-sm px-2 py-4 text-white bg-slate-500 font-semibold">Coins</a></li>
                <li><a href="#services" class="block text-sm px-2 py-4 hover:bg-slate-500 transition duration-300">Profile</a></li>
                <li><a href="#about" class="block text-sm px-2 py-4 hover:bg-slate-500 transition duration-300">Logout</a></li>
            </ul>
        </div>
        <!-- end of navigation -->
    """
  end


end
