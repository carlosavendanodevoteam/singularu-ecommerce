# The name of this view in Looker is "Billing Us Table"
view: billing_us_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `billing_us.billing_us_table` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Billing Account ID" in Explore.

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;  }
  measure: average_cost {
    type: average
    sql: ${cost} ;;  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: credits {
    hidden: yes
    sql: ${TABLE}.credits ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currency_conversion_rate {
    type: number
    sql: ${TABLE}.currency_conversion_rate ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: export {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.export_time ;;
  }

  dimension: invoice__month {
    type: string
    sql: ${TABLE}.invoice.month ;;
    group_label: "Invoice"
    group_item_label: "Month"
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: location__country {
    type: string
    sql: ${TABLE}.location.country ;;
    group_label: "Location"
    group_item_label: "Country"
  }

  dimension: location__location {
    type: string
    sql: ${TABLE}.location.location ;;
    group_label: "Location"
    group_item_label: "Location"
  }

  dimension: location__region {
    type: string
    sql: ${TABLE}.location.region ;;
    group_label: "Location"
    group_item_label: "Region"
  }

  dimension: location__zone {
    type: string
    sql: ${TABLE}.location.zone ;;
    group_label: "Location"
    group_item_label: "Zone"
  }

  dimension: project__ancestry_numbers {
    type: string
    sql: ${TABLE}.project.ancestry_numbers ;;
    group_label: "Project"
    group_item_label: "Ancestry Numbers"
  }

  dimension: project__id {
    type: string
    sql: ${TABLE}.project.id ;;
    group_label: "Project"
    group_item_label: "ID"
  }

  dimension: project__labels {
    hidden: yes
    sql: ${TABLE}.project.labels ;;
    group_label: "Project"
    group_item_label: "Labels"
  }

  dimension: project__name {
    type: string
    sql: ${TABLE}.project.name ;;
    group_label: "Project"
    group_item_label: "Name"
  }

  dimension: service__description {
    type: string
    sql: ${TABLE}.service.description ;;
    group_label: "Service"
    group_item_label: "Description"
  }

  dimension: service__id {
    type: string
    sql: ${TABLE}.service.id ;;
    group_label: "Service"
    group_item_label: "ID"
  }

  dimension: sku__description {
    type: string
    sql: ${TABLE}.sku.description ;;
    group_label: "SKU"
    group_item_label: "Description"
  }

  dimension: sku__id {
    type: string
    sql: ${TABLE}.sku.id ;;
    group_label: "SKU"
    group_item_label: "ID"
  }

  dimension: system_labels {
    hidden: yes
    sql: ${TABLE}.system_labels ;;
  }

  dimension: usage__amount {
    type: number
    sql: ${TABLE}.usage.amount ;;
    group_label: "Usage"
    group_item_label: "Amount"
  }

  dimension: usage__amount_in_pricing_units {
    type: number
    sql: ${TABLE}.usage.amount_in_pricing_units ;;
    group_label: "Usage"
    group_item_label: "Amount In Pricing Units"
  }

  dimension: usage__pricing_unit {
    type: string
    sql: ${TABLE}.usage.pricing_unit ;;
    group_label: "Usage"
    group_item_label: "Pricing Unit"
  }

  dimension: usage__unit {
    type: string
    sql: ${TABLE}.usage.unit ;;
    group_label: "Usage"
    group_item_label: "Unit"
  }

  dimension_group: usage_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.usage_end_time ;;
  }

  dimension_group: usage_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.usage_start_time ;;
  }
  measure: count {
    type: count
    drill_fields: [project__name]
  }
}

# The name of this view in Looker is "Billing Us Table Labels"
view: billing_us_table__labels {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: billing_us_table__labels {
    type: string
    hidden: yes
    sql: billing_us_table__labels ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Billing Us Table Credits"
view: billing_us_table__credits {
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;  }
  measure: average_amount {
    type: average
    sql: ${amount} ;;  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: billing_us_table__credits {
    type: string
    hidden: yes
    sql: billing_us_table__credits ;;
  }

  dimension: full_name {
    type: string
    sql: full_name ;;
  }

  dimension: name {
    type: string
    sql: name ;;
  }

  dimension: type {
    type: string
    sql: type ;;
  }
}

# The name of this view in Looker is "Billing Us Table System Labels"
view: billing_us_table__system_labels {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: billing_us_table__system_labels {
    type: string
    hidden: yes
    sql: billing_us_table__system_labels ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Billing Us Table Project Labels"
view: billing_us_table__project__labels {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
