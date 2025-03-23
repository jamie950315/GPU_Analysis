df.intel<-data.frame(read.csv("data\\Intel.csv", header = TRUE))
df.amd<-data.frame(read.csv("data\\AMD.csv", header = TRUE))
df.nvidia<-data.frame(read.csv("data\\NVIDIA.csv", header = TRUE))

require("useful")
require("ggrepel")

print(names(df.nvidia))
print(df.nvidia$GPU)
print(df.nvidia$`Generation`)

print("Starting...")

# #nvidia
# print("Nvidia Start")

# df.nvidia$Generation <- as.factor(df.nvidia$Generation)

# nvSP <- ggplot(df.nvidia, aes(x = SP, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +

#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "SP - Score",
#         x = "SP",
#         y = "Score",
#         color = "Generation") 

# nvTMU <- ggplot(df.nvidia, aes(x = TMU, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "TMU - Score",
#         x = "TMU",
#         y = "Score",
#         color = "Generation") 

# nvROP <- ggplot(df.nvidia, aes(x = ROP, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "ROP - Score",
#         x = "ROP",
#         y = "Score",
#         color = "Generation")

# nvMSRP <- ggplot(df.nvidia, aes(x = MSRP, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "MSRP - Score",
#         x = "MSRP",
#         y = "Score",
#         color = "Generation")

# nvTransistors <- ggplot(df.nvidia, aes(x = Transistors, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "Transistors - Score",
#         x = "Transistors",
#         y = "Score",
#         color = "Generation")

# nvConfig <- ggplot(df.nvidia, aes(x = Config, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "Config - Score",
#         x = "Config",
#         y = "Score",
#         color = "Generation")


# ggsave("plot\\nvidia\\nvidiaSP.png", nvSP, width = 10, height = 12)
# ggsave("plot\\nvidia\\nvidiaTMU.png", nvTMU, width = 10, height = 12)
# ggsave("plot\\nvidia\\nvidiaROP.png", nvROP, width = 10, height = 12)
# ggsave("plot\\nvidia\\nvidiaMSRP.png", nvMSRP, width = 10, height = 12)
# ggsave("plot\\nvidia\\nvidiaTransistors.png", nvTransistors, width = 10, height = 12)
# ggsave("plot\\nvidia\\nvidiaConfig.png", nvConfig, width = 10, height = 12)


# nvMSRPtoTransistors <- ggplot(df.nvidia, aes
# (x = MSRP, y = Transistors, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
#     labs(title = "MSRP - Transistors",
#         x = "MSRP",
#         y = "Transistors",
#         color = "Generation")

# nvMSRPtoVRAM <- ggplot(df.nvidia, aes(x = MSRP, y = VRAM, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_y_continuous(breaks = c(4, 8, 11, 12, 16, 24, 32)) +
#     scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
#     labs(title = "MSRP - VRAM",
#         x = "MSRP",
#         y = "VRAM",
#         color = "Generation")

# nvMSRPtoSP <- ggplot(df.nvidia, aes(x = MSRP, y = SP, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
#     labs(title = "MSRP - SP",
#         x = "MSRP",
#         y = "SP",
#         color = "Generation")

# nvMSRPtoTMU <- ggplot(df.nvidia, aes(x = MSRP, y = TMU, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
#     labs(title = "MSRP - TMU",
#         x = "MSRP",
#         y = "TMU",
#         color = "Generation")

# nvMSRPtoROP <- ggplot(df.nvidia, aes(x = MSRP, y = ROP, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
#     labs(title = "MSRP - ROP",
#         x = "MSRP",
#         y = "ROP",
#         color = "Generation")

# nvMSRPtoConfig <- ggplot(df.nvidia, aes(x = MSRP, y = Config, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
#     labs(title = "MSRP - Config",
#         x = "MSRP",
#         y = "Config",
#         color = "Generation")

# ggsave("plot\\nvidia\\nvMSRPtoTransistors.png", nvMSRPtoTransistors, width = 10, height = 12)
# ggsave("plot\\nvidia\\nvMSRPtoVRAM.png", nvMSRPtoVRAM, width = 10, height = 12)
# ggsave("plot\\nvidia\\nvMSRPtoSP.png", nvMSRPtoSP, width = 10, height = 12)
# ggsave("plot\\nvidia\\nvMSRPtoTMU.png", nvMSRPtoTMU, width = 10, height = 12)
# ggsave("plot\\nvidia\\nvMSRPtoROP.png", nvMSRPtoROP, width = 10, height = 12)
# ggsave("plot\\nvidia\\nvMSRPtoConfig.png", nvMSRPtoConfig, width = 10, height = 12)


# print("Nvidia Complete")




# #intel

# print("Intel Start")

# df.intel$Generation <- as.factor(df.intel$Generation)

# intelSP <- ggplot(df.intel, aes(x = SP, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "SP - Score",
#          x = "SP",
#          y = "Score",
#          color = "Generation")

# intelTMU <- ggplot(df.intel, aes(x = TMU, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "TMU - Score",
#          x = "TMU",
#          y = "Score",
#          color = "Generation")

# intelROP <- ggplot(df.intel, aes(x = ROP, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "ROP - Score",
#          x = "ROP",
#          y = "Score",
#          color = "Generation")

# intelMSRP <- ggplot(df.intel, aes(x = MSRP, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "MSRP - Score",
#          x = "MSRP",
#          y = "Score",
#          color = "Generation")

# intelTransistors <- ggplot(df.intel, aes(x = Transistors, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "Transistors - Score",
#          x = "Transistors",
#          y = "Score",
#          color = "Generation")

# intelConfig <- ggplot(df.intel, aes(x = Config, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "Config - Score",
#          x = "Config",
#          y = "Score",
#          color = "Generation")

# ggsave("plot\\intel\\intelSP.png", intelSP, width = 10, height = 12)
# ggsave("plot\\intel\\intelTMU.png", intelTMU, width = 10, height = 12)
# ggsave("plot\\intel\\intelROP.png", intelROP, width = 10, height = 12)
# ggsave("plot\\intel\\intelMSRP.png", intelMSRP, width = 10, height = 12)
# ggsave("plot\\intel\\intelTransistors.png", intelTransistors, width = 10, height = 12)
# ggsave("plot\\intel\\intelConfig.png", intelConfig, width = 10, height = 12)

# intelMSRPtoTransistors <- ggplot(df.intel, aes(x = MSRP, y = Transistors, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
#     labs(title = "MSRP - Transistors",
#          x = "MSRP",
#          y = "Transistors",
#          color = "Generation")

# intelMSRPtoVRAM <- ggplot(df.intel, aes(x = MSRP, y = VRAM, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_y_continuous(breaks = c(6, 8, 10, 12)) +
#     scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
#     labs(title = "MSRP - VRAM",
#          x = "MSRP",
#          y = "VRAM",
#          color = "Generation")

# intelMSRPtoSP <- ggplot(df.intel, aes(x = MSRP, y = SP, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
#     labs(title = "MSRP - SP",
#          x = "MSRP",
#          y = "SP",
#          color = "Generation")

# intelMSRPtoTMU <- ggplot(df.intel, aes(x = MSRP, y = TMU, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
#     labs(title = "MSRP - TMU",
#          x = "MSRP",
#          y = "TMU",
#          color = "Generation")

# intelMSRPtoROP <- ggplot(df.intel, aes(x = MSRP, y = ROP, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
#     labs(title = "MSRP - ROP",
#          x = "MSRP",
#          y = "ROP",
#          color = "Generation")

# intelMSRPtoConfig <- ggplot(df.intel, aes(x = MSRP, y = Config, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
#     labs(title = "MSRP - Config",
#          x = "MSRP",
#          y = "Config",
#          color = "Generation")

# ggsave("plot\\intel\\intelMSRPtoTransistors.png", intelMSRPtoTransistors, width = 10, height = 12)
# ggsave("plot\\intel\\intelMSRPtoVRAM.png", intelMSRPtoVRAM, width = 10, height = 12)
# ggsave("plot\\intel\\intelMSRPtoSP.png", intelMSRPtoSP, width = 10, height = 12)
# ggsave("plot\\intel\\intelMSRPtoTMU.png", intelMSRPtoTMU, width = 10, height = 12)
# ggsave("plot\\intel\\intelMSRPtoROP.png", intelMSRPtoROP, width = 10, height = 12)
# ggsave("plot\\intel\\intelMSRPtoConfig.png", intelMSRPtoConfig, width = 10, height = 12)

# print("Intel Complete")


# #amd

# print("AMD Start")

# df.amd$Generation <- as.factor(df.amd$Generation)

# amdSP <- ggplot(df.amd, aes(x = SP, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "SP - Score",
#          x = "SP",
#          y = "Score",
#          color = "Generation")

# amdTMU <- ggplot(df.amd, aes(x = TMU, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "TMU - Score",
#          x = "TMU",
#          y = "Score",
#          color = "Generation")

# amdROP <- ggplot(df.amd, aes(x = ROP, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "ROP - Score",
#          x = "ROP",
#          y = "Score",
#          color = "Generation")

# amdMSRP <- ggplot(df.amd, aes(x = MSRP, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "MSRP - Score",
#          x = "MSRP",
#          y = "Score",
#          color = "Generation")

# amdTransistors <- ggplot(df.amd, aes(x = Transistors, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "Transistors - Score",
#          x = "Transistors",
#          y = "Score",
#          color = "Generation")

# amdConfig <- ggplot(df.amd, aes(x = Config, y = Score, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     labs(title = "Config - Score",
#          x = "Config",
#          y = "Score",
#          color = "Generation")

# ggsave("plot\\amd\\amdSP.png", amdSP, width = 10, height = 12)
# ggsave("plot\\amd\\amdTMU.png", amdTMU, width = 10, height = 12)
# ggsave("plot\\amd\\amdROP.png", amdROP, width = 10, height = 12)
# ggsave("plot\\amd\\amdMSRP.png", amdMSRP, width = 10, height = 12)
# ggsave("plot\\amd\\amdTransistors.png", amdTransistors, width = 10, height = 12)
# ggsave("plot\\amd\\amdConfig.png", amdConfig, width = 10, height = 12)

# amdMSRPtoTransistors <- ggplot(df.amd, aes(x = MSRP, y = Transistors, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
#     labs(title = "MSRP - Transistors",
#          x = "MSRP",
#          y = "Transistors",
#          color = "Generation")

# amdMSRPtoVRAM <- ggplot(df.amd, aes(x = MSRP, y = VRAM, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_y_continuous(breaks = c(4, 6, 8, 12, 16, 20, 24)) +
#     scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
#     labs(title = "MSRP - VRAM",
#          x = "MSRP",
#          y = "VRAM",
#          color = "Generation")

# amdMSRPtoSP <- ggplot(df.amd, aes(x = MSRP, y = SP, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
#     labs(title = "MSRP - SP",
#          x = "MSRP",
#          y = "SP",
#          color = "Generation")

# amdMSRPtoTMU <- ggplot(df.amd, aes(x = MSRP, y = TMU, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
#     labs(title = "MSRP - TMU",
#          x = "MSRP",
#          y = "TMU",
#          color = "Generation")

# amdMSRPtoROP <- ggplot(df.amd, aes(x = MSRP, y = ROP, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
#     labs(title = "MSRP - ROP",
#          x = "MSRP",
#          y = "ROP",
#          color = "Generation")

# amdMSRPtoConfig <- ggplot(df.amd, aes(x = MSRP, y = Config, color = Generation)) +
#     geom_point(alpha = 0.6) +
#     geom_text_repel(aes(label = GPU),
#                     size = 4,
#                     max.overlaps = Inf,
#                     box.padding = 1.2,
#                     segment.color = "#90888895") +
#     geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
#     scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
#     labs(title = "MSRP - Config",
#          x = "MSRP",
#          y = "Config",
#          color = "Generation")

# ggsave("plot\\amd\\amdMSRPtoTransistors.png", amdMSRPtoTransistors, width = 10, height = 12)
# ggsave("plot\\amd\\amdMSRPtoVRAM.png", amdMSRPtoVRAM, width = 10, height = 12)
# ggsave("plot\\amd\\amdMSRPtoSP.png", amdMSRPtoSP, width = 10, height = 12)
# ggsave("plot\\amd\\amdMSRPtoTMU.png", amdMSRPtoTMU, width = 10, height = 12)
# ggsave("plot\\amd\\amdMSRPtoROP.png", amdMSRPtoROP, width = 10, height = 12)
# ggsave("plot\\amd\\amdMSRPtoConfig.png", amdMSRPtoConfig, width = 10, height = 12)

# print("AMD Complete")

#universal comparisons

#2025GPU
nv50sub<-subset(df.nvidia, Generation == "50")
amd9000sub<-subset(df.amd, Generation == "9000")
intelBsub<-subset(df.intel, Generation == "B")
nv50sub$Brand <- "Nvidia"
amd9000sub$Brand <- "AMD"
intelBsub$Brand <- "Intel"

c25Sub<-rbind(nv50sub, amd9000sub, intelBsub)
c25ScorePlot<-ggplot(c25Sub, aes(x=MSRP, y=Score, color=Brand))+
    geom_point(alpha=0.6)+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_y_continuous(breaks=seq(0, 14000, by=1000))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Intel"="#0071C5", "Nvidia"="#76B900"))+
    labs(title="MSRP - Score : 2025 GPU",
         x="MSRP",
         y="Score",
         color="Brand")

c25VRAMPlot<-ggplot(c25Sub, aes(x=MSRP, y=VRAM, color=Brand))+
    geom_point(alpha=0.6)+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(4, 32, by=2))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Intel"="#0071C5", "Nvidia"="#76B900"))+
    labs(title="MSRP - VRAM : 2025 GPU",
         x="MSRP",
         y="VRAM",
         color="Brand")

ggsave("plot\\universal\\2025ScorePlot.png", c25ScorePlot, width=10, height=12)
ggsave("plot\\universal\\2025VRAMPlot.png", c25VRAMPlot, width=10, height=12)


#2022-2024GPU
nv40sub<-subset(df.nvidia, Generation == "40")
amd7000sub<-subset(df.amd, Generation == "7000")
intelAsub<-subset(df.intel, Generation == "A")
nv40sub$Brand <- "Nvidia"
amd7000sub$Brand <- "AMD"
intelAsub$Brand <- "Intel"

c22Sub<-rbind(nv40sub, amd7000sub, intelAsub)
c22ScorePlot<-ggplot(c22Sub, aes(x=MSRP, y=Score, color=Brand))+
    geom_point(alpha=0.6)+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_y_continuous(breaks=seq(0, 10000, by=500))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Intel"="#0071C5", "Nvidia"="#76B900"))+
    labs(title="MSRP - Score : 2022-2024 GPU",
         x="MSRP",
         y="Score",
         color="Brand")

c22VRAMPlot<-ggplot(c22Sub, aes(x=MSRP, y=VRAM, color=Brand))+
    geom_point(alpha=0.6)+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(4, 32, by=2))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Intel"="#0071C5", "Nvidia"="#76B900"))+
    labs(title="MSRP - VRAM : 2022-2024 GPU",
         x="MSRP",
         y="VRAM",
         color="Brand")
         
ggsave("plot\\universal\\2022-2024ScorePlot.png", c22ScorePlot, width=10, height=12)
ggsave("plot\\universal\\2022-2024VRAMPlot.png", c22VRAMPlot, width=10, height=12)

#2020-2022GPU
nv30sub<-subset(df.nvidia, Generation == "30")
amd6000sub<-subset(df.amd, Generation == "6000")

nv30sub$Brand <- "Nvidia"
amd6000sub$Brand <- "AMD"

c20Sub<-rbind(nv30sub, amd6000sub)
c20ScorePlot<-ggplot(c20Sub, aes(x=MSRP, y=Score, color=Brand))+
    geom_point(alpha=0.6)+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_y_continuous(breaks=seq(0, 8000, by=500))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Nvidia"="#76B900"))+
    labs(title="MSRP - Score : 2020-2022 GPU",
         x="MSRP",
         y="Score",
         color="Brand")

c20VRAMPlot<-ggplot(c20Sub, aes(x=MSRP, y=VRAM, color=Brand))+
    geom_point(alpha=0.6)+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(4, 32, by=2))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Nvidia"="#76B900"))+
    labs(title="MSRP - VRAM : 2020-2022 GPU",
         x="MSRP",
         y="VRAM",
         color="Brand")

ggsave("plot\\universal\\2020-2022ScorePlot.png", c20ScorePlot, width=10, height=12)
ggsave("plot\\universal\\2020-2022VRAMPlot.png", c20VRAMPlot, width=10, height=12)

#2018-2019GPU
nv20sub<-subset(df.nvidia, Generation == "20")
amd5000sub<-subset(df.amd, Generation == "5000")

nv20sub$Brand <- "Nvidia"
amd5000sub$Brand <- "AMD"

c18Sub<-rbind(nv20sub, amd5000sub)
c18ScorePlot<-ggplot(c18Sub, aes(x=MSRP, y=Score, color=Brand))+
    geom_point(alpha=0.6)+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_x_continuous(breaks=seq(200, 2500, by=100))+
    scale_y_continuous(breaks=seq(0, 6000, by=250))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Nvidia"="#76B900"))+
    labs(title="MSRP - Score : 2018-2019 GPU",
         x="MSRP",
         y="Score",
         color="Brand")

c18VRAMPlot<-ggplot(c18Sub, aes(x=MSRP, y=VRAM, color=Brand))+
    geom_point(alpha=0.6)+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(4, 32, by=2))+
    scale_x_continuous(breaks=seq(200, 2500, by=100))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Nvidia"="#76B900"))+
    labs(title="MSRP - VRAM : 2018-2019 GPU",
         x="MSRP",
         y="VRAM",
         color="Brand")

ggsave("plot\\universal\\2018-2019ScorePlot.png", c18ScorePlot, width=10, height=12)
ggsave("plot\\universal\\2018-2019VRAMPlot.png", c18VRAMPlot, width=10, height=12)



allSub<-rbind(nv50sub, amd9000sub, intelBsub, nv40sub, amd7000sub, intelAsub, nv30sub, amd6000sub, nv20sub, amd5000sub)
allScorePlot<-ggplot(allSub, aes(x=MSRP, y=Score, color=Generation))+
    geom_point(alpha=0.6)+
    geom_text_repel(aes(label=GPU),
                    size=3,
                    max.overlaps=Inf,
                    box.padding=1.35,
                    force=1.8,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Generation))+
    scale_x_continuous(breaks=seq(200, 2500, by=100))+
    scale_y_continuous(breaks=seq(0, 14000, by=500))+
    scale_color_manual(values=c("9000"="#ED1C24","7000"="#ED1C24","6000"="#ED1C24","5000"="#ED1C24", 
                                "B"="#0071C5","A"="#0071C5",
                                "50"="#76B900","40"="#76B900","30"="#76B900","20"="#76B900"))+
    labs(title="MSRP - Score : All GPU",
         x="MSRP",
         y="Score",
         color="Generation")

allVRAMPlot<-ggplot(allSub, aes(x=MSRP, y=VRAM, color=Generation))+
    geom_point(alpha=0.6)+
    geom_text_repel(aes(label=GPU),
                    size=3,
                    max.overlaps=Inf,
                    box.padding=1.35,
                    force=1.8,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Generation))+
    scale_y_continuous(breaks=seq(4, 32, by=2))+
    scale_x_continuous(breaks=seq(200, 2500, by=100))+
    scale_color_manual(values=c("9000"="#ED1C24","7000"="#ED1C24","6000"="#ED1C24","5000"="#ED1C24", 
                                "B"="#0071C5","A"="#0071C5",
                                "50"="#76B900","40"="#76B900","30"="#76B900","20"="#76B900"))+
    labs(title="MSRP - VRAM : All GPU",
         x="MSRP",
         y="VRAM",
         color="Generation")         

ggsave("plot\\universal\\allScorePlot.png", allScorePlot, width=10, height=12)
ggsave("plot\\universal\\allVRAMPlot.png", allVRAMPlot, width=10, height=12)











