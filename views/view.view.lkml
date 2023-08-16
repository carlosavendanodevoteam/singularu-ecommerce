# If necessary, uncomment the line below to include explore_source.

# include: "carlos-training-looker.model.lkml"

view: add_a_unique_name_1692182415 {
  derived_table: {
    explore_source: order_items {
      column: user_id {}
      column: order_count {}
      column: total_revenue {}
    }
  }
  dimension: user_id {
    description: ""
    type: number
  }
  dimension: order_count {
    description: ""
    type: number
  }
  dimension: total_revenue {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
}
