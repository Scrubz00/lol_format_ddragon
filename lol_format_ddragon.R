library(tidyverse)

######### Create dataframe items ###############################################

items <- rjson::fromJSON(file = "http://ddragon.leagueoflegends.com/cdn/11.12.1/data/en_US/item.json")

items.name <- c()
items.key <- c()
items.description <- c()
items.cost <- c()
items.sell <- c()
items.from <- c()
items.into <- c()
items.purchasable <- c()
items.plaintext <- c()
items.tags <- c()
items.depth <- c()

1:length(items$data) %>%
  purrr::walk(function(x){
    items.name <<- c(items.name, items$data[[x]]$name)
    items.key <<- c(items.key, names(items$data)[x])
    items.description <<- c(items.description, items$data[[x]]$description)
    items.cost <<- c(items.cost, items$data[[x]]$gold$total)
    items.sell <<- c(items.sell, items$data[[x]]$gold$sell)
    items.from <<- c(items.from, if_else(is.null(items$data[[x]]$from),
                                         true = NA_character_,
                                         false = str_c(items$data[[x]]$from, collapse = "-")))
    items.into <<- c(items.into, if_else(is.null(items$data[[x]]$into),
                                         true = NA_character_,
                                         false = str_c(items$data[[x]]$into, collapse = "-")))
    items.purchasable <<- c(items.purchasable, items$data[[x]]$gold$purchasable)
    items.plaintext <<- c(items.plaintext, items$data[[x]]$plaintext)
    items.tags <<- c(items.tags, str_c(items$data[[x]]$tags, collapse = "-"))
    items.stats <<- c(items.stats, items$data[[x]]$stats)
    items.depth <<- c(items.depth, if_else(is.null(items$data[[x]]$depth),
                                           true = NA_real_,
                                           false = items$data[[x]]$depth))
  })

items_df <- data.frame(
  name = items.name,
  key = items.key,
  cost = items.cost,
  sell = items.sell,
  from = items.from,
  into = items.into,
  purchasable = items.purchasable,
  plaintext = items.plaintext,
  tags = items.tags,
  # stats = items.stats,
  depth = items.depth,
  description = items.description
)

write.csv(items_df, paste0("items_", items$version, ".csv"))

# stats.name <- c()
# 
# 1:length(items$data) %>%
#   purrr::walk(function(x){
#     stats.name <<- c(stats.name, items$data[[x]]$stats %>% names()) %>% unique()
#   })

######### Create dataframe champions ###########################################

champions <- rjson::fromJSON(file = "http://ddragon.leagueoflegends.com/cdn/11.12.1/data/en_US/champion.json")

champions.id <- c()
champions.key <- c()
champions.name <- c()
champions.title <- c()
# champions.blurb <- c()
champions.info.attack <- c()
champions.info.defense <- c()
champions.info.magic <- c()
champions.info.difficulty <- c()
champions.tags <- c()
champions.stats.hp <- c()
champions.stats.hpperlevel <- c()
champions.stats.mp <- c()
champions.stats.mpperlevel <- c()
champions.stats.movespeed <- c()
champions.stats.armor <- c()
champions.stats.armorperlevel <- c()
champions.stats.spellblock <- c()
champions.stats.spellblockperlevel <- c()
champions.stats.attackrange <- c()
champions.stats.hpregen <- c()
champions.stats.hpregenperlevel <- c()
champions.stats.mpregen <- c()
champions.stats.mpregenperlevel <- c()
champions.stats.crit <- c()
champions.stats.critperlevel <- c()
champions.stats.attackdamage <- c()
champions.stats.attackdamageperlevel <- c()
champions.stats.attackspeed <- c()
champions.stats.attackspeedperlevel <- c()

1:length(champions$data) %>%
  purrr::walk(function(x){
    champions.id <<- c(champions.id, champions$data[[x]]$id)
    champions.key <<- c(champions.key, champions$data[[x]]$key)
    champions.name <<- c(champions.name, champions$data[[x]]$name)
    champions.title <<- c(champions.title, champions$data[[x]]$title)
    # champions.blurb <<- c(champions.blurb, champions$data[[x]]$blurb)
    champions.info.attack <<- c(champions.info.attack, champions$data[[x]]$info$attack)
    champions.info.defense <<- c(champions.info.defense, champions$data[[x]]$info$defense)
    champions.info.magic <<- c(champions.info.magic, champions$data[[x]]$info$magic)
    champions.info.difficulty <<- c(champions.info.difficulty, champions$data[[x]]$info$difficulty)
    champions.tags <<- c(champions.tags, str_c(champions$data[[x]]$tags, collapse = "-"))
    champions.stats.hp <<- c(champions.stats.hp, champions$data[[x]]$stats$hp)
    champions.stats.hpperlevel <<- c(champions.stats.hpperlevel, champions$data[[x]]$stats$hpperlevel)
    champions.stats.mp <<- c(champions.stats.mp, champions$data[[x]]$stats$mp)
    champions.stats.mpperlevel <<- c(champions.stats.mpperlevel, champions$data[[x]]$stats$mpperlevel)
    champions.stats.movespeed <<- c(champions.stats.movespeed, champions$data[[x]]$stats$movespeed)
    champions.stats.armor <<- c(champions.stats.armor, champions$data[[x]]$stats$armor)
    champions.stats.armorperlevel <<- c(champions.stats.armorperlevel, champions$data[[x]]$stats$armorperlevel)
    champions.stats.spellblock <<- c(champions.stats.spellblock, champions$data[[x]]$stats$spellblock)
    champions.stats.spellblockperlevel <<- c(champions.stats.spellblockperlevel, champions$data[[x]]$stats$spellblockperlevel)
    champions.stats.attackrange <<- c(champions.stats.attackrange, champions$data[[x]]$stats$attackrange)
    champions.stats.hpregen <<- c(champions.stats.hpregen, champions$data[[x]]$stats$hpregen)
    champions.stats.hpregenperlevel <<- c(champions.stats.hpregenperlevel, champions$data[[x]]$stats$hpregenperlevel)
    champions.stats.mpregen <<- c(champions.stats.mpregen, champions$data[[x]]$stats$mpregen)
    champions.stats.mpregenperlevel <<- c(champions.stats.mpregenperlevel, champions$data[[x]]$stats$mpregenperlevel)
    champions.stats.crit <<- c(champions.stats.crit, champions$data[[x]]$stats$crit)
    champions.stats.critperlevel <<- c(champions.stats.critperlevel, champions$data[[x]]$stats$critperlevel)
    champions.stats.attackdamage <<- c(champions.stats.attackdamage, champions$data[[x]]$stats$attackdamage)
    champions.stats.attackdamageperlevel <<- c(champions.stats.attackdamageperlevel, champions$data[[x]]$stats$attackdamageperlevel)
    champions.stats.attackspeed <<- c(champions.stats.attackspeed, champions$data[[x]]$stats$attackspeed)
    champions.stats.attackspeedperlevel <<- c(champions.stats.attackspeedperlevel, champions$data[[x]]$stats$attackspeedperlevel)
  })

champions_df <- data.frame(
  id = champions.id,
  key = champions.key,
  name = champions.name,
  title = champions.name,
  # blurb = champions.blurb,
  info.attack = champions.info.attack,
  info.defense = champions.info.defense,
  info.magic = champions.info.magic,
  info.difficulty = champions.info.difficulty,
  tags = champions.tags,
  stats.hp = champions.stats.hp,
  stats.hpperlevel = champions.stats.hpperlevel,
  stats.mp = champions.stats.mp,
  stats.mpperlevel = champions.stats.mpperlevel,
  stats.movespeed = champions.stats.movespeed,
  stats.armor = champions.stats.armor,
  stats.armorperlevel = champions.stats.armorperlevel,
  stats.spellblock = champions.stats.spellblock,
  stats.spellblockperlevel = champions.stats.spellblockperlevel,
  stats.attackrange = champions.stats.attackrange,
  stats.hpregen = champions.stats.hpregen,
  stats.hpregenperlevel = champions.stats.hpregenperlevel,
  stats.mpregen = champions.stats.mpregen,
  stats.mpregenperlevel = champions.stats.mpregenperlevel,
  stats.crit = champions.stats.crit,
  stats.critperlevel = champions.stats.critperlevel,
  stats.attackdamage = champions.stats.attackdamage,
  stats.attackdamageperlevel = champions.stats.attackdamageperlevel,
  stats.attackspeed = champions.stats.attackspeed,
  stats.attackspeedperlevel = champions.stats.attackspeedperlevel
)

write.csv(champions_df, paste0("champions_", champions$version, ".csv"))
