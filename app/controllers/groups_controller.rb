class GroupsController < ApplicationController
  def show
    @groups = Group.all.includes(:documents)
    @group = Group.find(params[:id])
    @documents = @group.documents
  end
end
