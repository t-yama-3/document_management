class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    # binding.pry
    @documents = @group.documents
  end
end
