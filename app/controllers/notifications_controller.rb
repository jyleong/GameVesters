class NotificationsController < ApplicationController

  def update
    Notification.find(params[:id]).update_attributes(notification_params)
  end

  def destroy
    # TODO eric: dismiss notifications
    Notification.find(params[:id]).destroy
  end

  def refresh
    render :partial => "layouts/nav_notifications"
  end

  def mark_all
    Notification.where('user_id LIKE ?', params[:user_id]).where('read LIKE ?', false).update_all(read: true)
    redirect_back(fallback_location: root_path)
  end

  private

    def notification_params
      params.require(:notification).permit(:read)
    end

end
