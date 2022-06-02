class ContentsController < ApplicationController
  def index
    matching_contents = Content.all

    @list_of_contents = matching_contents.order({ :created_at => :desc })

    render({ :template => "contents/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_contents = Content.where({ :id => the_id })

    @the_content = matching_contents.at(0)

    
    matching_customers = Photo.all

    @list_of_customers = matching_customers.order({ :first_name => :desc})

    render({ :template => "contents/show.html.erb" })
  end

  def create
    the_content = Content.new
    the_content.name = params.fetch("query_name")
    the_content.ae_name = params.fetch("query_ae_name")

    if the_content.valid?
      the_content.save
      redirect_to("/contents", { :notice => "Content created successfully." })
    else
      redirect_to("/contents", { :alert => the_content.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_content = Content.where({ :id => the_id }).at(0)

    the_content.name = params.fetch("query_name")
    the_content.ae_name = params.fetch("query_ae_name")

    if the_content.valid?
      the_content.save
      redirect_to("/contents/#{the_content.id}", { :notice => "Content updated successfully."} )
    else
      redirect_to("/contents/#{the_content.id}", { :alert => the_content.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_content = Content.where({ :id => the_id }).at(0)

    the_content.destroy

    redirect_to("/contents", { :notice => "Content deleted successfully."} )
  end
end
