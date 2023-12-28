resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = var.auto_scaling_name

  policy_type = "SimpleScaling"

}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = var.auto_scaling_name


  policy_type = "SimpleScaling"
}




resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric checks cpu usage"
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]
}




resource "aws_cloudwatch_metric_alarm" "request_count_high" {
  alarm_name          = "request-count-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "RequestCount"
  namespace           = "AWS/ApplicationELB"
  period              = "120"
  statistic           = "Sum"
  threshold           = "1000"
  alarm_description   = "This metric checks request count"
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]
}



resource "aws_cloudwatch_metric_alarm" "request_count_low" {
  alarm_name          = "request-count-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "RequestCount"
  namespace           = "AWS/ApplicationELB"
  period              = "120"
  statistic           = "Sum"
  threshold           = "500"
  alarm_description   = "This metric checks request count"
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]
}




