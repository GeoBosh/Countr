library(hexSticker)

p <- ggplot(aes(x = year, y = log(value)), data = pbc2) +
  geom_point(cex=.01)+
  geom_line(data = subset(pbc2, id == "11"), colour = "purple") +
  labs(x = "", y = "") +
  theme_void() +
  theme(strip.background = element_blank(),
        strip.text = element_blank())

sticker(p, package = "CountR",
        p_size = 10,p_color = "#7F38EC",
        s_x = 1, s_y = .8, s_width = 1.2, s_height = 0.8,
        h_color = "#C76730",
        h_fill = "#3090C7")
