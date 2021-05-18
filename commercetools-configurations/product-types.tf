resource "commercetools_product_type" "device" {
  name        = "Device"
  description = "Device"
  key         = "device"

  attribute {
      name = "Brand"
      label = {
          da = "Brand"
          en = "Brand"
      }
      required = true
      constraint = "SameForAll"
      searchable = true
      type {
          name = "text"
      }
  }

  attribute {
      name = "ScreenSize"
      label = {
          da = "Skærmstørrelse"
          en = "Screen size"
      }
      required = false
      constraint = "SameForAll"
      searchable = true
      type {
          name = "text"
      }
  }

  attribute {
    name = "5G"
    label = {
      da = "5G"
      en = "5G"
    }
    required = true
    constraint = "SameForAll"
    searchable = true
    type {
      name = "boolean"
    }
  }

  attribute {
      name = "Storage"
      label = {
          da = "Storage"
          en = "Storage"
      }
      required = true
      constraint = "None"
      searchable = true
      type {
          name = "text"
      }
  }

  attribute {
      name = "ColorDescription"
      label = {
          da = "Farvebeskrivelse"
          en = "Color description"
      }
      required = true
      constraint = "None"
      searchable = true
      type {
          name = "ltext"
      }
  }

  attribute {
    name = "FilterColor"
    label = {
      da = "Filterfarve"
      en = "Filter color"
    }
    required = false
    constraint = "None"
    searchable = true
    type {
      name = "ltext"
    }
  }

  attribute {
    name = "InternalPrice"
    label = {
      da = "Intern pris"
      en = "Internal price"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "money"
    }
  }

  attribute {
    name = "MasterProductRelations"
    label = {
      da = "Produkt relationer"
      en = "Product relations"
    }
    required = false
    constraint = "SameForAll"
    searchable = false
    type {
      name = "set"
      element_type {
        name = "nested"
        type_reference = commercetools_product_type.product_relation.id
      }
    }
  }

  attribute {
    name = "VariantProductRelations"
    label = {
      da = "Produkt relationer"
      en = "Product relations"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "set"
      element_type {
        name = "nested"
        type_reference = commercetools_product_type.product_relation.id
      }
    }
  }

  attribute {
    name = "MasterCategoryRelations"
    label = {
      da = "Kategori relationer"
      en = "Category relations"
    }
    required = false
    constraint = "SameForAll"
    searchable = false
    type {
      name = "set"
      element_type {
        name = "nested"
        type_reference = commercetools_product_type.category_relation.id
      }
    }
  }

  attribute {
    name = "VariantCategoryRelations"
    label = {
      da = "Kategori relationer"
      en = "Category relations"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "set"
      element_type {
        name = "nested"
        type_reference = commercetools_product_type.category_relation.id
      }
    }
  }
}

resource "commercetools_product_type" "accessory" {
  name        = "Accessory"
  description = "Accessory"
  key         = "accessory"

  attribute {
      name = "Brand"
      label = {
          da = "Brand"
          en = "Brand"
      }
      required = true
      constraint = "SameForAll"
      searchable = true
      type {
          name = "text"
      }
  }

  attribute {
      name = "ColorDescription"
      label = {
          da = "Farvebeskrivelse"
          en = "Color description"
      }
      required = true
      constraint = "None"
      searchable = true
      type {
          name = "ltext"
      }
  }

  attribute {
    name = "FilterColor"
    label = {
      da = "Filterfarve"
      en = "Filter color"
    }
    required = false
    constraint = "None"
    searchable = true
    type {
      name = "ltext"
    }
  }

  attribute {
    name = "InternalPrice"
    label = {
      da = "Intern pris"
      en = "Internal price"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "money"
    }
  }

  attribute {
    name = "MasterProductRelations"
    label = {
      da = "Produkt relationer"
      en = "Product relations"
    }
    required = false
    constraint = "SameForAll"
    searchable = false
    type {
      name = "set"
      element_type {
        name = "nested"
        type_reference = commercetools_product_type.product_relation.id
      }
    }
  }
  
  attribute {
    name = "VariantProductRelations"
    label = {
      da = "Produkt relationer"
      en = "Product relations"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "set"
      element_type {
        name = "nested"
        type_reference = commercetools_product_type.product_relation.id
      }
    }
  }

  attribute {
    name = "MasterCategoryRelations"
    label = {
      da = "Kategori relationer"
      en = "Category relations"
    }
    required = false
    constraint = "SameForAll"
    searchable = false
    type {
      name = "set"
      element_type {
        name = "nested"
        type_reference = commercetools_product_type.category_relation.id
      }
    }
  }

  attribute {
    name = "VariantCategoryRelations"
    label = {
      da = "Kategori relationer"
      en = "Category relations"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "set"
      element_type {
        name = "nested"
        type_reference = commercetools_product_type.category_relation.id
      }
    }
  }
}

resource "commercetools_product_type" "mobile_subscription" {
  name        = "Mobile Subscription"
  description = "Mobile Subscription"
  key         = "mobilesubscription"

  attribute {
    name = "BindingPeriod"
    label = {
      da = "Bindingsperiode"
      en = "Binding period"
    }
    required = false
    constraint = "SameForAll"
    searchable = false
    type {
      name = "number"
    }
  }
}

resource "commercetools_product_type" "fee" {
  name        = "Fee"
  description = "A Fee can be added to the Cart as an extra cost"
  key         = "fee"
}

resource "commercetools_product_type" "service_option" {
  name        = "Service Option"
  description = "Service Option"
  key         = "serviceoption"
}

resource "commercetools_product_type" "product_relation" {
  name = "Product Relation"
  description = "Product Relation (nested)"
  key = "productrelation"

  attribute {
    name  = "Product"
    label = {
      da = "Produkt"
      en = "Product"
    }
    required = true
    constraint = "None"
    searchable = false
    type {
      name = "reference"
      reference_type_id = "product"
    }
  }

  attribute {
    name  = "SKU"
    label = {
      da = "SKU"
      en = "SKU"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "text"
    }
  }

  # attribute {
  #   name = "RelationType"
  #   label = {
  #     da = "Relationstype"
  #     en = "Relation type"
  #   }
  #   required = true
  #   constraint = "None"
  #   searchable = false
  #   type {
  #     name = "text"
  #   }
  # }
}

resource "commercetools_product_type" "category_relation" {
  name = "Category Relation"
  description = "Category Relation (nested)"
  key = "categoryrelation"

  attribute {
    name  = "Category"
    label = {
      da = "Kategori"
      en = "Category"
    }
    required = true
    constraint = "None"
    searchable = false
    type {
      name = "reference"
      reference_type_id = "category"
    }
  }

  # attribute {
  #   name = "RelationType"
  #   label = {
  #     da = "Relationstype"
  #     en = "Relation type"
  #   }
  #   required = true
  #   constraint = "None"
  #   searchable = false
  #   type {
  #     name = "text"
  #   }
  # }
}