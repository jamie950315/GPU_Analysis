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









