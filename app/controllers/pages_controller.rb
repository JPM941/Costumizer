class PagesController < ApplicationController
  def home
  end

  def dashboard
    # mes demandes de reservation auprès d'autres loueurs
    @mybookings = Booking.where(user_id: current_user)
    # ma liste de costume dont je suis proprio
    @mycostumes = Costume.where(user_id: current_user)


    #@bookingrequests

    # itérer sur mes costumes
    # @mycostumes.each do |mycostume|

    # # vérifier les bookings de chaque costume
    #   @booked_costume = mycostume.booking_id == true

    #   # vérifier le statut de ces bookings
    #   # créer une nouvelle variable @pending_bookings et @confirmed_bookings
    #   if booked_costume.status == "pending"
    #     @pending_bookings <
    #   elsif booked_costume.status == "confirmed"
    #     @confirmed_bookings <
    #   end
    # end
    # pusher les bookings correspondants dans ces variables
  end
end
