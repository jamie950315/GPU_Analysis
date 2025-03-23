df.intel<-data.frame(read.csv("data\\Intel.csv", header = TRUE))
df.amd<-data.frame(read.csv("data\\AMD.csv", header = TRUE))
df.nvidia<-data.frame(read.csv("data\\NVIDIA.csv", header = TRUE))

require("useful")
require("ggrepel")

print(names(df.nvidia))
print(df.nvidia$GPU)
print(df.nvidia$`Generation`)



#nvidia

df.nvidia$Generation <- as.factor(df.nvidia$Generation)

nvSP <- ggplot(df.nvidia, aes(x = SP, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +

    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "SP - Score",
        x = "SP",
        y = "Score",
        color = "Generation") 

nvTMU <- ggplot(df.nvidia, aes(x = TMU, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "TMU - Score",
        x = "TMU",
        y = "Score",
        color = "Generation") 

nvROP <- ggplot(df.nvidia, aes(x = ROP, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "ROP - Score",
        x = "ROP",
        y = "Score",
        color = "Generation")

nvMSRP <- ggplot(df.nvidia, aes(x = MSRP, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "MSRP - Score",
        x = "MSRP",
        y = "Score",
        color = "Generation")

nvTransistors <- ggplot(df.nvidia, aes(x = Transistors, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "Transistors - Score",
        x = "Transistors",
        y = "Score",
        color = "Generation")


ggsave("plot\\nvidia\\nvidiaSP.png", nvSP, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaTMU.png", nvTMU, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaROP.png", nvROP, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaMSRP.png", nvMSRP, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaTransistors.png", nvTransistors, width = 10, height = 12)


nvMSRPtoTransistors <- ggplot(df.nvidia, aes
(x = MSRP, y = Transistors, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    labs(title = "MSRP - Transistors",
        x = "MSRP",
        y = "Transistors",
        color = "Generation")

nvMSRPtoVRAM <- ggplot(df.nvidia, aes(x = MSRP, y = VRAM, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_y_continuous(breaks = c(4, 8, 11, 12, 16, 24, 32)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    labs(title = "MSRP - VRAM",
        x = "MSRP",
        y = "VRAM",
        color = "Generation")

nvMSRPtoSP <- ggplot(df.nvidia, aes(x = MSRP, y = SP, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    labs(title = "MSRP - SP",
        x = "MSRP",
        y = "SP",
        color = "Generation")

nvMSRPtoTMU <- ggplot(df.nvidia, aes(x = MSRP, y = TMU, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    labs(title = "MSRP - TMU",
        x = "MSRP",
        y = "TMU",
        color = "Generation")

nvMSRPtoROP <- ggplot(df.nvidia, aes(x = MSRP, y = ROP, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    labs(title = "MSRP - ROP",
        x = "MSRP",
        y = "ROP",
        color = "Generation")

ggsave("plot\\nvidia\\nvMSRPtoTransistors.png", nvMSRPtoTransistors, width = 10, height = 12)
ggsave("plot\\nvidia\\nvMSRPtoVRAM.png", nvMSRPtoVRAM, width = 10, height = 12)
ggsave("plot\\nvidia\\nvMSRPtoSP.png", nvMSRPtoSP, width = 10, height = 12)
ggsave("plot\\nvidia\\nvMSRPtoTMU.png", nvMSRPtoTMU, width = 10, height = 12)
ggsave("plot\\nvidia\\nvMSRPtoROP.png", nvMSRPtoROP, width = 10, height = 12)







#intel

df.intel$Generation <- as.factor(df.intel$Generation)

intelSP <- ggplot(df.intel, aes(x = SP, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "SP - Score",
         x = "SP",
         y = "Score",
         color = "Generation")

intelTMU <- ggplot(df.intel, aes(x = TMU, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "TMU - Score",
         x = "TMU",
         y = "Score",
         color = "Generation")

intelROP <- ggplot(df.intel, aes(x = ROP, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "ROP - Score",
         x = "ROP",
         y = "Score",
         color = "Generation")

intelMSRP <- ggplot(df.intel, aes(x = MSRP, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "MSRP - Score",
         x = "MSRP",
         y = "Score",
         color = "Generation")

intelTransistors <- ggplot(df.intel, aes(x = Transistors, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "Transistors - Score",
         x = "Transistors",
         y = "Score",
         color = "Generation")

ggsave("plot\\intel\\intelSP.png", intelSP, width = 10, height = 12)
ggsave("plot\\intel\\intelTMU.png", intelTMU, width = 10, height = 12)
ggsave("plot\\intel\\intelROP.png", intelROP, width = 10, height = 12)
ggsave("plot\\intel\\intelMSRP.png", intelMSRP, width = 10, height = 12)
ggsave("plot\\intel\\intelTransistors.png", intelTransistors, width = 10, height = 12)

intelMSRPtoTransistors <- ggplot(df.intel, aes(x = MSRP, y = Transistors, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - Transistors",
         x = "MSRP",
         y = "Transistors",
         color = "Generation")

intelMSRPtoVRAM <- ggplot(df.intel, aes(x = MSRP, y = VRAM, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_y_continuous(breaks = c(6, 8, 10, 12)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - VRAM",
         x = "MSRP",
         y = "VRAM",
         color = "Generation")

intelMSRPtoSP <- ggplot(df.intel, aes(x = MSRP, y = SP, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - SP",
         x = "MSRP",
         y = "SP",
         color = "Generation")

intelMSRPtoTMU <- ggplot(df.intel, aes(x = MSRP, y = TMU, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - TMU",
         x = "MSRP",
         y = "TMU",
         color = "Generation")

intelMSRPtoROP <- ggplot(df.intel, aes(x = MSRP, y = ROP, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - ROP",
         x = "MSRP",
         y = "ROP",
         color = "Generation")

ggsave("plot\\intel\\intelMSRPtoTransistors.png", intelMSRPtoTransistors, width = 10, height = 12)
ggsave("plot\\intel\\intelMSRPtoVRAM.png", intelMSRPtoVRAM, width = 10, height = 12)
ggsave("plot\\intel\\intelMSRPtoSP.png", intelMSRPtoSP, width = 10, height = 12)
ggsave("plot\\intel\\intelMSRPtoTMU.png", intelMSRPtoTMU, width = 10, height = 12)
ggsave("plot\\intel\\intelMSRPtoROP.png", intelMSRPtoROP, width = 10, height = 12)



#amd

df.amd$Generation <- as.factor(df.amd$Generation)

amdSP <- ggplot(df.amd, aes(x = SP, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "SP - Score",
         x = "SP",
         y = "Score",
         color = "Generation")

amdTMU <- ggplot(df.amd, aes(x = TMU, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "TMU - Score",
         x = "TMU",
         y = "Score",
         color = "Generation")

amdROP <- ggplot(df.amd, aes(x = ROP, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "ROP - Score",
         x = "ROP",
         y = "Score",
         color = "Generation")

amdMSRP <- ggplot(df.amd, aes(x = MSRP, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "MSRP - Score",
         x = "MSRP",
         y = "Score",
         color = "Generation")

amdTransistors <- ggplot(df.amd, aes(x = Transistors, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "Transistors - Score",
         x = "Transistors",
         y = "Score",
         color = "Generation")

ggsave("plot\\amd\\amdSP.png", amdSP, width = 10, height = 12)
ggsave("plot\\amd\\amdTMU.png", amdTMU, width = 10, height = 12)
ggsave("plot\\amd\\amdROP.png", amdROP, width = 10, height = 12)
ggsave("plot\\amd\\amdMSRP.png", amdMSRP, width = 10, height = 12)
ggsave("plot\\amd\\amdTransistors.png", amdTransistors, width = 10, height = 12)

amdMSRPtoTransistors <- ggplot(df.amd, aes(x = MSRP, y = Transistors, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - Transistors",
         x = "MSRP",
         y = "Transistors",
         color = "Generation")

amdMSRPtoVRAM <- ggplot(df.amd, aes(x = MSRP, y = VRAM, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_y_continuous(breaks = c(4, 6, 8, 12, 16, 20, 24)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - VRAM",
         x = "MSRP",
         y = "VRAM",
         color = "Generation")

amdMSRPtoSP <- ggplot(df.amd, aes(x = MSRP, y = SP, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - SP",
         x = "MSRP",
         y = "SP",
         color = "Generation")

amdMSRPtoTMU <- ggplot(df.amd, aes(x = MSRP, y = TMU, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - TMU",
         x = "MSRP",
         y = "TMU",
         color = "Generation")

amdMSRPtoROP <- ggplot(df.amd, aes(x = MSRP, y = ROP, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - ROP",
         x = "MSRP",
         y = "ROP",
         color = "Generation")

ggsave("plot\\amd\\amdMSRPtoTransistors.png", amdMSRPtoTransistors, width = 10, height = 12)
ggsave("plot\\amd\\amdMSRPtoVRAM.png", amdMSRPtoVRAM, width = 10, height = 12)
ggsave("plot\\amd\\amdMSRPtoSP.png", amdMSRPtoSP, width = 10, height = 12)
ggsave("plot\\amd\\amdMSRPtoTMU.png", amdMSRPtoTMU, width = 10, height = 12)
ggsave("plot\\amd\\amdMSRPtoROP.png", amdMSRPtoROP, width = 10, height = 12)







