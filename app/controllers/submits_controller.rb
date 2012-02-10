class SubmitsController < ApplicationController

  # GET /submits
  # GET /submits.json
  def index
    @submits = Submit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @submits }
    end
  end

  # GET /submits/1
  # GET /submits/1.json
  def show
    @submit = Submit.find(params[:id])

      respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @submit }
    end
  end

  # GET /submits/new
  # GET /submits/new.json
  def new
    @submit = Submit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @submit }
    end
  end

  # GET /submits/1/edit
  def edit
    @submit = Submit.find(params[:id])
  end

  # POST /submits
  # POST /submits.json
  def create
  
 
#  @submit = submits.build(params[:submit])

# @submit = submit.build(params[:submit])

 #  if @submit.save
 #    respond_with @submit
 #else
 # respond_with @submit.errors, :status => :unprocessable_entity
 #end
#end


 @submit = Submit.new(params[:submit])

    respond_to do |format|
      if @submit.save
        format.html {  redirect_to new_submit_path, :notice => "Uspjesna prijava"}
        format.json { render :json => @submit, :status => :created, :location => @submit }
      else
        format.html { render :action => "new" }
        format.json { render :json => @submit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /submits/1
  # PUT /submits/1.json
  def update
    @submit = Submit.find(params[:id])

    respond_to do |format|
      if @submit.update_attributes(params[:submit])
        format.html { redirect_to new_submit_path, :notice => 'Submit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @submit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submits/1
  # DELETE /submits/1.json
  def destroy
    @submit = Submit.find(params[:id])
    @submit.destroy

    respond_to do |format|
      format.html { redirect_to submits_url }
      format.json { head :no_content }
    end
  end
end
