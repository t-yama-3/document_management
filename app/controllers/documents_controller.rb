class DocumentsController < ApplicationController
  before_action :move_to_public_documents, only: [:owner, :participation]
  before_action :move_to_user_registration, except: [:index, :show, :public, :owner, :participation]
  before_action :set_owner_sections, :set_participation_sections, except: [:destroy]
  
  def index
    # なんか迂遠なことやってる（後日シンプルにする：自分が作成したものはマイページのみ表示でいい！）
    return @user_sections = [] unless user_signed_in?
    sections = current_user.participate_sections + Section.where(user_id: current_user.id)
    @user_sections = (sections.uniq).sort_by!{|ms|ms.created_at}.reverse!
    @messages = Message.where(user_id: current_user.id).or(Message.where(receiver_id: current_user.id)).order("created_at DESC").limit(10)
  end

  def new
    @document = Document.new
  end

  def create
    new_document_params = document_params
    if section_params[:section_name] != ""
      section = Section.new(section_params)
      section.participate_users << current_user
      if section.save
        new_document_params[:section_id] = section.id
      else
        redirect_to root_path
      end
    end
    @document = Document.new(new_document_params)
    if @document.save
      redirect_to document_path(@document.id)
    else
      render :new
    end
  end

  # 編集権（作成者のみ）
  def edit
    @document = Document.find(params[:id])
    return redirect_to document_path unless @document.user_id == current_user.id
  end

  def update
    edit_document_params = document_params
    if section_params[:section_name] != ""
      section = Section.new(section_params)
      section.participate_users << current_user
      if section.save
        edit_document_params[:section_id] = section.id
      else
        return redirect_to root_path
      end
    end
    @document = Document.find(params[:id])
    if @document.update(edit_document_params)
      return redirect_to document_path(@document.id)
    else
      render :edit
    end
  end

  # 閲覧権（グループ参加者、文書作成者、公開設定の場合は全員可）
  def show
    @document = Document.find(params[:id])
    unless  @document.section.disclosure_before_type_cast == 1 || @document.section.participate_users.where(id: current_user.id).present? || @document.user_id == current_user.id
      return redirect_to root_path
    end
    @comments = @document.comments
    @comment = Comment.new
  end

  # 削除権（作成者のみ）
  def destroy
    @document = Document.find(params[:id])
    return redirect_to document_path unless @document.user_id == current_user.id
    if @document.destroy
      redirect_to root_path
    else
      flash.now[:alert] = "文書情報を削除できませんでした。"
      render :show
    end
  end

  # def owner
  #   @documents = Document.where(user_id: current_user.id).order('created_at DESC')
  # end

  def owner
    @add_class1 = " mainBtn__link--select"
    @documents = Document.where(user_id: current_user.id).order('created_at DESC')
    render :select_index
  end

  def participation
    @add_class2 = " mainBtn__link--select"
    @documents = Document.participate(current_user.id)
    render :select_index
  end
  
  def public
    @add_class3 = " mainBtn__link--select"
    @documents = Document.public
    render :select_index
  end



  # 代替文書の編集権（作成者のみ）
  def alt_edit
    @document = Document.find(params[:id])
    return redirect_to document_path unless @document.user_id == current_user.id
  end

  def alt_update
    @document = Document.find(params[:id])
    if @document.update(alt: params[:alt])
      redirect_to document_path(@document.id)
    else
      render :alt_edit
    end
  end

  # 代替文書の削除権（作成者のみ）
  def alt_delete
    @document = Document.find(params[:id])
    return redirect_to document_path unless @document.user_id == current_user.id
    if @document.update(alt: nil)
      redirect_to document_path(@document.id)
    else
      render :edit
    end
  end

  private
  def document_params
    params.require(:document).permit(:title, :src, :note, :section_id).merge(user_id: current_user.id)
  end

  def section_params
    params.require(:document).permit(:section_name).merge(user_id: current_user.id, disclosure: 0)
  end

  def move_to_user_registration
    redirect_to new_user_registration_path unless user_signed_in?
  end

  def move_to_public_documents
    redirect_to public_documents_path unless user_signed_in?
  end

  def set_owner_sections
    return @owner_sections = [] unless user_signed_in?
    @owner_sections = current_user.sections.order("created_at DESC").limit(0)
  end

  def set_participation_sections
    return @participation_sections = [] unless user_signed_in?
    @participation_sections = current_user.participate_sections.order("created_at DESC").limit(0)
  end
end
