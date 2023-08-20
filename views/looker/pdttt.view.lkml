# If necessary, uncomment the line below to include explore_source.

# include: "carlos-training-looker.model.lkml"

view: view_name {
  derived_table: {
    explore_source: order_items {
      column: order_id {}
      column: product_id { field: inventory_items.product_id }
      column: age { field: users.age }
      column: count { field: users.count }
    }
  }
  dimension: order_id {
    description: ""
    type: number
  }
  dimension: product_id {
    description: ""
    type: number
  }
  dimension: age {
    description: ""
    type: number
  }
  dimension: count {
    description: ""
    type: number
  }
}
