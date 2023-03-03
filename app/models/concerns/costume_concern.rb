module CostumeConcern

  def booked_dates
    bookings.pluck(:start_date, :end_date)
  end
  # renvoie un array d'array des dates de debut et de fin de tous les bookings du costume


  def simple_format_booked_dates
    booked_dates.deep_map(&:to_s)
  end
  # renvoie un array d'array des dates de debut et de fin de tous les bookings du costume mais sous la forme stringifiée : "1991-12-28"


  def booked_dates_json_objects
    simple_format_booked_dates.map do |dates_arr|
      {
        from: dates_arr.first,
        to: dates_arr.last
      }
    end
  end

  def flatpickr_booked_dates_object
    {
      dateFormat: "Y-m-d",
      disable: booked_dates_json_objects
    }
  end
end
