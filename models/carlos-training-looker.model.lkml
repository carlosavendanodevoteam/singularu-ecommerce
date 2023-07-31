# Define the database connection to be used for this model.
connection: "carlos-looker-training"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: carlos-training-looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: carlos-training-looker_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Carlos-training-looker"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: trees {}

explore: days_with_rain {}

explore: billing_us_table {
    join: billing_us_table__labels {
      view_label: "Billing Us Table: Labels"
      sql: LEFT JOIN UNNEST(${billing_us_table.labels}) as billing_us_table__labels ;;
      relationship: one_to_many
    }
    join: billing_us_table__credits {
      view_label: "Billing Us Table: Credits"
      sql: LEFT JOIN UNNEST(${billing_us_table.credits}) as billing_us_table__credits ;;
      relationship: one_to_many
    }
    join: billing_us_table__system_labels {
      view_label: "Billing Us Table: System Labels"
      sql: LEFT JOIN UNNEST(${billing_us_table.system_labels}) as billing_us_table__system_labels ;;
      relationship: one_to_many
    }
    join: billing_us_table__project__labels {
      view_label: "Billing Us Table: Project Labels"
      sql: LEFT JOIN UNNEST(${billing_us_table.project__labels}) as billing_us_table__project__labels ;;
      relationship: one_to_many
    }
}

explore: dasdas {}

explore: trees2 {}

explore: movies {}

explore: user_ratings {}

explore: partition_by_day {}

explore: viewaverage_per_movie {}

explore: aircraft {}

explore: inventory_items {}

explore: products {}

explore: distribution_centers {}

explore: orders {}

explore: events {}

explore: carriers {}

explore: airports {}

explore: users {}

explore: aircraft_models {}

explore: flights {}

explore: tripsname {}

explore: base_table {}

explore: partitioned_table {}

explore: clustered_table {}

explore: partitioned_clustered_table {}

explore: order_items {}

