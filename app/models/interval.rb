class Interval < ActiveRecord::Base
  attr_accessible :start_range, :total_emission, :user_id

  has_many :receipts
  has_many :goals
  belongs_to :user

  def Interval.sort_by_month(current_user, full_date)
    if full_date.nil?
      date = Date.today
    else
      date = Date.parse(full_date)
    end

    start_date = date.beginning_of_month
    end_date = date.end_of_month
    logger.info "---------> start_date: #{start_date}"
    logger.info "---------> end_date: #{end_date}"

    # Find the interval if there is one
    next_date = start_date
    logger.info "---------> next_date: #{next_date}"

    while next_date != end_date.next_day  do
      # next_date = next_date
      logger.info "Inside the loop = #{next_date}"
      search_interval_result = Interval.where('start_range = ? AND user_id = ?', next_date.to_time, current_user.id)
      logger.info "SEARCH INTERVAL CLASS ---> #{search_interval_result.class}"
      logger.info "INTERVAL ---> #{search_interval_result.inspect}"

      if search_interval_result.blank?
        logger.info "NO INTERVAL FOR THIS DATE!"
        new_interval = Interval.new
        new_interval.user_id = current_user.id
        new_interval.start_range = next_date.to_time
        new_interval.total_emission = 0
        new_interval.save
      else
        logger.info "YES INTERVAL FOR THIS DATE!"
      end
      next_date = next_date.next_day
      logger.info "====> next_date: #{next_date}"
    end

    monthly_interval = Interval.order('start_range desc').where('user_id = ? AND start_range >= ? AND start_range <= ?', current_user.id, start_date, end_date.next_day)
  end


  def Interval.create_interval_if_needed(current_user, receipt)
    current_day = DateTime.now.beginning_of_day
    new_receipt_date = receipt.date

    logger.info "CURRENT USER IS ---> #{current_user}"
    logger.info "CURRENT DATETIME IS ---> #{current_day}"
    logger.info "CURRENT RECEIPT DATETIME IS ---> #{new_receipt_date}"

    # Find the interval if there is one
    search_interval_result = Interval.where('start_range = ? AND user_id = ?', new_receipt_date, current_user.id).limit(1)

    logger.info "SEARCH INTERVAL CLASS ---> #{search_interval_result.class}"
    logger.info "INTERVAL ---> #{search_interval_result.inspect}"

    logger.info "what is receipt? #{receipt.attributes}"

    if search_interval_result.blank?
      logger.info "NO INTERVAL FOR THIS DATE!"
      # Here's where we will make a new interval, use the receipt and user_id to fill it and save it.

      new_interval = Interval.new
      new_interval.user_id = current_user.id
      new_interval.start_range = receipt.date
      new_interval.total_emission = receipt.emission
      new_interval.save
      receipt.interval_id = new_interval.id
      receipt.save
      logger.info "==============================================="
      logger.info "receipt interval id ----------> #{receipt.interval_id}"
      logger.info "==============================================="

    else

      logger.info "YES, WE HAVE AN INTERVAL FOR THIS DATE!"
      logger.info  "YES!!!!!! #{search_interval_result.class}"
      existing_interval = search_interval_result.first
      logger.info  "YES!!!!!! #{existing_interval.class}"
      existing_interval.total_emission = (existing_interval.total_emission.to_d + receipt.emission.to_d).round(2).to_s
      logger.info "TOTAL EMISSION YES!!!!!! #{existing_interval.total_emission}"
      existing_interval.save
      receipt.interval_id = existing_interval.id
      receipt.save
      logger.info "+++++++++++++++++++++++++++++++++++++++++++++++"
      logger.info "receipt interval id ----------> #{receipt.interval_id}"
      logger.info "+++++++++++++++++++++++++++++++++++++++++++++++"

    end
  end

  def Interval.do_something
    @something = "yo!!"
    return @something
  end

  def Interval.check_interval_for_goal(current_user, goal)
    new_goal_date = goal.start_time
    logger.info "CURRENT RECEIPT DATETIME IS ---> #{new_goal_date}"

    # Find the interval if there is one
    search_interval_result = Interval.where('start_range = ? AND user_id = ?', new_goal_date, current_user.id).limit(1)

    logger.info "SEARCH INTERVAL CLASS ---> #{search_interval_result.class}"
    logger.info "INTERVAL ---> #{search_interval_result.inspect}"

    if search_interval_result.blank?
      logger.info "NO INTERVAL FOR THIS DATE!"
      new_interval = Interval.new
      new_interval.user_id = current_user.id
      new_interval.start_range = new_goal_date
      new_interval.total_emission = 0
      new_interval.save
      goal.interval_id = new_interval.id
      logger.info "==============================================="
      logger.info "goal interval id ----------> #{goal.interval_id}"
      logger.info "==============================================="

    else
      logger.info "YES, WE HAVE AN INTERVAL FOR THIS DATE!"
      logger.info  "YES!!!!!! #{search_interval_result.class}"
      existing_interval = search_interval_result.first
      logger.info  "YES!!!!!! #{existing_interval.class}"

      goal.interval_id = existing_interval.id
      logger.info "+++++++++++++++++++++++++++++++++++++++++++++++"
      logger.info "goal interval id ----------> #{goal.interval_id}"
      logger.info "+++++++++++++++++++++++++++++++++++++++++++++++"
    end
  end


end
