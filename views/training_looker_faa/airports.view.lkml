# The name of this view in Looker is "Airports"
view: airports {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `training_looker_faa.airports` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Act Date" in Explore.

  dimension: act_date {
    type: string
    sql: ${TABLE}.act_date ;;
  }

  dimension: aero_cht {
    type: string
    sql: ${TABLE}.aero_cht ;;
  }

  dimension: c_ldg_rts {
    type: string
    sql: ${TABLE}.c_ldg_rts ;;
  }

  dimension: cbd_dir {
    type: string
    sql: ${TABLE}.cbd_dir ;;
  }

  dimension: cbd_dist {
    type: number
    sql: ${TABLE}.cbd_dist ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cbd_dist {
    type: sum
    sql: ${cbd_dist} ;;  }
  measure: average_cbd_dist {
    type: average
    sql: ${cbd_dist} ;;  }

  dimension: cert {
    type: string
    sql: ${TABLE}.cert ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: cntl_twr {
    type: yesno
    sql: ${TABLE}.cntl_twr ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: cust_intl {
    type: string
    sql: ${TABLE}.cust_intl ;;
  }

  dimension: elevation {
    type: number
    sql: ${TABLE}.elevation ;;
  }

  dimension: faa_dist {
    type: string
    sql: ${TABLE}.faa_dist ;;
  }

  dimension: faa_region {
    type: string
    sql: ${TABLE}.faa_region ;;
  }

  dimension: fac_type {
    type: string
    sql: ${TABLE}.fac_type ;;
  }

  dimension: fac_use {
    type: string
    sql: ${TABLE}.fac_use ;;
  }

  dimension: fed_agree {
    type: string
    sql: ${TABLE}.fed_agree ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: joint_use {
    type: string
    sql: ${TABLE}.joint_use ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: major {
    type: yesno
    sql: ${TABLE}.major ;;
  }

  dimension: mil_rts {
    type: string
    sql: ${TABLE}.mil_rts ;;
  }

  dimension: own_type {
    type: string
    sql: ${TABLE}.own_type ;;
  }

  dimension: site_number {
    type: string
    sql: ${TABLE}.site_number ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  measure: count {
    type: count
    drill_fields: [full_name]
  }
}
