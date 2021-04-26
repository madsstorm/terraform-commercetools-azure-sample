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
          name = "ltext"
      }
  }

  attribute {
      name = "ColorDescription"
      label = {
          da = "Farvebeskrivelse"
          en = "Color description"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "ltext"
      }
  }

  attribute {
    name = "CostPrice"
    label = {
      da = "Kostpris"
      en = "Cost price"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "money"
    }
  }

  attribute {
    name = "RelationsForProduct"
    label = {
      da = "Relationer for produkt"
      en = "Relations for product"
    }
    required = false
    constraint = "SameForAll"
    searchable = false
    type {
      name = "nested"
      type_reference = commercetools_product_type.product_relation.id
    }
  }

  attribute {
    name = "RelationsForVariant"
    label = {
      da = "Relationer for variant"
      en = "Relations for variant"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "nested"
      type_reference = commercetools_product_type.product_relation.id
    }
  }
  
  attribute {
      name = "StorageGB"
      label = {
          da = "Storage GB"
          en = "Storage GB"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "number"
      }
  }

  attribute {
      name = "ScreenSizeInches"
      label = {
          da = "Skærmstørrelse tommer"
          en = "Screen size inches"
      }
      required = false
      constraint = "None"
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
    required = false
    constraint = "None"
    searchable = true
    type {
      name = "boolean"
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
          name = "ltext"
      }
  }

  attribute {
      name = "ColorDescription"
      label = {
          da = "Farve beskrivelse"
          en = "Color description"
      }
      required = false
      constraint = "None"
      searchable = true
      type {
          name = "ltext"
      }
  }

  attribute {
    name = "CostPrice"
    label = {
      da = "Kostpris"
      en = "Cost price"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "money"
    }
  }

  attribute {
    name = "RelationsForProduct"
    label = {
      da = "Relationer for produkt"
      en = "Relations for product"
    }
    required = false
    constraint = "SameForAll"
    searchable = false
    type {
      name = "nested"
      type_reference = commercetools_product_type.product_relation.id
    }
  }

  attribute {
    name = "RelationsForVariant"
    label = {
      da = "Relationer for variant"
      en = "Relations for variant"
    }
    required = false
    constraint = "None"
    searchable = false
    type {
      name = "nested"
      type_reference = commercetools_product_type.product_relation.id
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