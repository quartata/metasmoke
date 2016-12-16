every 3.minutes do
  runner 'SmokeDetector.check_smokey_status'
end

every 1.day do
  runner 'ReasonsHelper.check_for_inactive_reasons'
  runner 'ReasonsHelper.calculate_weights_for_flagging'
end
