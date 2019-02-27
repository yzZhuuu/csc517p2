class HomeController < ApplicationController

  def index

  end

  def waitlistboard

    @tours = Tour.all

  end

  def booklistboard
    @tours = Tour.all

  end

  def bookmarklistboard
    @tours = Tour.all

  end

end
