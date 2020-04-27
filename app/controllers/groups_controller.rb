class GroupsController < ApplicationController
  def show
    @documents = Group.find(params[:id]).documents
  end
end
