require_dependency "charger/application_controller"

module Charger
  class PlansController < ApplicationController
    before_action :set_plan, only: [:show, :edit, :update, :destroy]

    # GET /plans
    def index
      @plans = Plan.all
    end

    # GET /plans/1
    def show
      respond_to do |format|
        format.json { render :json => @plan }
        format.html { render :json => @plan } #{ :empty_response }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_plan
        @plan = Plan.friendly.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def plan_params
        params[:plan]
      end
  end
end
