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
      name = "ScreenSizeInches"
      label = {
          da = "Skærmstørrelse tommer"
          en = "Screen size inches"
      }
      required = false
      constraint = "SameForAll"
      searchable = true
      type {
          name = "number"
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
    name = "Subscriptions"
    label = {
      da = "Abonnementer"
      en = "Subscriptions"
    }
    required = false
    constraint = "SameForAll"
    searchable = true
    type {
      name = "set"
      element_type {
        name = "reference"
        reference_type_id = "product"
      }      
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
      name = "StorageGB"
      label = {
          da = "Storage GB"
          en = "Storage GB"
      }
      required = true
      constraint = "None"
      searchable = true
      type {
          name = "number"
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
}

resource "commercetools_product_type" "subscription" {
  name        = "Subscription"
  description = "Subscription"
  key         = "subscription"
}

resource "commercetools_product_type" "product_relation" {
  name = "Product Relation"
  description = "Product Relation"
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
    name  = "VariantId"
    label = {
      da = "Variant Id"
      en = "Variant Id"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "number"
    }
  }

  attribute {
    name = "RelationType"
    label = {
      da = "Relationstype"
      en = "Relation type"
    }
    required = true
    constraint = "None"
    searchable = false
    type {
      name = "text"
    }
  }
}