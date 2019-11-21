bti_colors <- c("#0d4459", "#00a990", "#d05527", "#a33332",
                "#b381d0",  "#dfb9a6", "#b2b2b1", "#2A2A2A", "#ecc627")

require(tidyverse); require(grid); require(magick)

logo_grob <- grid::rasterGrob(magick::image_read("http://jrmcbride.github.io/btilogo.png"))

bti_logo <- function(xmin, xmax, ymin, ymax){ # Takes input for logo dimensions, *relative to data*
  list(
    annotation_custom(logo_grob,
                      xmin, xmax, ymin, ymax),
    coord_cartesian(clip = "off"),
    theme_bw(), # Can be replaced with other themes
    theme(plot.margin = unit(c(1, 2, 2, 1), "lines")),
    scale_color_manual(values = bti_colors, aesthetics = c("color", "fill"))
  )
}

### Example

library(tidyverse)

iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
    geom_point(alpha = 0.6) +
    geom_smooth(method = "lm", se = F) +
    bti_logo(8, 9.5, 1.5, 1.7)

    
