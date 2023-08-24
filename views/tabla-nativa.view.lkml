# If necessary, uncomment the line below to include explore_source.

# include: "carlos-training-looker.model.lkml"

view: vista_nativa {
  derived_table: {
    explore_source: order_items {
      column: order_id {}
      column: user_id {}
      column: order_item_count {}
      column: total_revenue {}
    }
  }
  dimension: order_id {
    description: ""
    type: number
  }
  dimension: user_id {
    description: ""
    type: number
  }
  dimension: order_item_count {
    description: ""
    type: number
  }
  dimension: total_revenue {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
}
