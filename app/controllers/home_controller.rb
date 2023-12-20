# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def tweets

  end

  def message; end

  def message_box; end

  def tweet_show; end
end
