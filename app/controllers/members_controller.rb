class MembersController < ApplicationController
  before_action :set_member, only: %i[ show update destroy ]

  # GET /members
  def index
    @members = Member.all

    render json: @members
  end

  # GET /members/1
  def show
    render json: @member
  end

  def create
    member = Member.create!(member_params)
    token = AuthenticationTokenService.encode(member.id)
    render json: { token: token }, status: :created
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def destroy
    member = Member.find(params[:id])
    if member.destroy
      render json: { message: 'Member deleted successfully' }
    else
      render json: { errors: 'Failed to delete member!' }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.permit(:name, :email, :approved)
    end
end
