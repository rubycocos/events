
module EventDb
  module Model

class Event < ActiveRecord::Base

  ## todo: auto-add today ?? - why, why not?
  ##   move order('start_date') into its own scope ??

  scope :upcoming, ->( today=Date.today ) { order('start_date').where( 'start_date > ?', today )  }

  ## rename to now_on/on_now/now_playing/running/etc. - why? why not??
  scope :live,     ->( today=Date.today ) { order('start_date').where( 'start_date <= ? AND end_date >= ?', today, today )  }


  def current_day( today=Date.today )
    today.mjd - start_date.mjd + 1   # calculate current event day (1,2,3,etc.)
  end
  alias_method :cur_day, :current_day

  def diff_days( today=Date.today )
    start_date.mjd - today.mjd      # note: mjd == Modified Julian Day Number
  end



  def date_fmt( fmt='long' )  #  date pretty printed (pre-formatted) as string (with weeknames)

    ## note: wday - (0-6, Sunday is zero).
    if days == 1
      buf = ''
      if fmt == 'long'
        buf << Date::ABBR_DAYNAMES[start_date.wday]
        buf << ' '
      end
      buf << Date::ABBR_MONTHNAMES[start_date.month]
      buf << '/'
      buf << start_date.day.to_s
    elsif days == 2
      buf = ''
      if fmt == 'long'
        buf << Date::ABBR_DAYNAMES[start_date.wday]
        buf << '+'
        buf << Date::ABBR_DAYNAMES[end_date.wday]
        buf << ' '
      end
      buf << Date::ABBR_MONTHNAMES[start_date.month]
      buf << '/'
      buf << start_date.day.to_s
      buf << '+'
      if start_date.month != end_date.month
        buf << Date::ABBR_MONTHNAMES[end_date.month]
        buf << '/'
      end
      buf << end_date.day.to_s
    else  ## assume multi day
      buf = ''
      if fmt == 'long'
        buf << Date::ABBR_DAYNAMES[start_date.wday]
        buf << '-'
        buf << Date::ABBR_DAYNAMES[end_date.wday]
        buf << ' '
      end
      buf << Date::ABBR_MONTHNAMES[start_date.month]
      buf << '/'
      buf << start_date.day.to_s
      buf << '-'
      if start_date.month != end_date.month
        buf << Date::ABBR_MONTHNAMES[end_date.month]
        buf << '/'
      end
      buf << end_date.day.to_s
    end

    buf
  end # method date_fmt
end # class Event

  end # module Model

  Models = Model   ## note: add conveniene shortcut for models
end # module EventDb
