class InnDashboard::PromotionsController < InnDashboard::InnDashboardController
  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = @inn.promotions.build(promotion_params)
    if @promotion.save
      redirect_to inn_management_path, notice: 'Promoção criada com sucesso!'
    else
      render :new, status: 422
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :start_date, :end_date)
  end
end