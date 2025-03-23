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
                    size = 5,
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
                    size = 5,
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
                    size = 5,
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
                    size = 5,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "MSRP - Score",
        x = "MSRP",
        y = "Score",
        color = "Generation")

nvGPUClock <- ggplot(df.nvidia, aes(x = GPUClock, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 5,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "GPUClock - Score",
        x = "GPUClock",
        y = "Score",
        color = "Generation")

nvVRAMClock <- ggplot(df.nvidia, aes(x = VRAMClock, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 5,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "VRAMClock - Score",
        x = "VRAMClock",
        y = "Score",
        color = "Generation")

nvVRAM <- ggplot(df.nvidia, aes(x = VRAM, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 5,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "VRAM - Score",
        x = "VRAM",
        y = "Score",
        color = "Generation")

nvMemory.Type <- ggplot(df.nvidia, aes(x = Memory.Type, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 5,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "Memory.Type - Score",
        x = "Memory.Type",
        y = "Score",
        color = "Generation")

nvNM <- ggplot(df.nvidia, aes(x = NM, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 5,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "NM - Score",
        x = "NM",
        y = "Score",
        color = "Generation")

nvTransistors <- ggplot(df.nvidia, aes(x = Transistors, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 5,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "Transistors - Score",
        x = "Transistors",
        y = "Score",
        color = "Generation")

nvYear <- ggplot(df.nvidia, aes(x = Year, y = Score, color = Generation)) +
    geom_point(alpha = 0.6) +
    geom_text_repel(aes(label = GPU),
                    size = 5,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, aes(group = Generation)) +
    labs(title = "Year - Score",
        x = "Year",
        y = "Score",
        color = "Generation")


ggsave("plot\\nvidia\\nvidiaSP.png", nvSP, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaTMU.png", nvTMU, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaROP.png", nvROP, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaMSRP.png", nvMSRP, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaGPUClock.png", nvGPUClock, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaVRAMClock.png", nvVRAMClock, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaVRAM.png", nvVRAM, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaMemory.Type.png", nvMemory.Type, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaNM.png", nvNM, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaTransistors.png", nvTransistors, width = 10, height = 12)
ggsave("plot\\nvidia\\nvidiaYear.png", nvYear, width = 10, height = 12)







