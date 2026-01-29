void Render()
{
    auto app = GetApp();

    auto playground = cast<CSmArenaClient>(app.CurrentPlayground);
    if (playground is null) {
        return; 
    }
    auto arena = playground.ArenaInterface;
    if (arena is null) {
        return;
    }
    if (!S_Accel_Enabled && !S_Brake_Enabled) {
        return; // No indicators enabled
    }

    // Memory address debug
    // for (uint i = 0x1140; i < 0x1180; i++) {
    //     UI::Text(Text::Format("0x%04x", i) + " = " + Dev::GetOffsetUint32(arena, i));
    // }
    
    bool isAccelerating = Dev::GetOffsetUint32(arena, 0x1154) & 4 > 0 && S_Accel_Enabled;
    bool isBraking = Dev::GetOffsetUint32(arena, 0x1154) & 8 > 0 && S_Brake_Enabled;

    if (isAccelerating || isBraking || S_Preview) {
        vec4 color = vec4(0, 0, 0, 0);
        if (isAccelerating && isBraking) {
            color = S_Accel_And_Brake_Color;
        } else if (isAccelerating || S_Preview) {
            color = S_Accel_Color;
        } else if (isBraking) {
            color = S_Brake_Color;
        }
        auto pos = vec2(Display::GetWidth(), Display::GetHeight()) * vec2(S_Accel_ScreenPosX, S_Accel_ScreenPosY);
        nvgCircle(pos, color, S_Accel_Size);
    }
}

void nvgCircle(vec2 xy, vec4 col, float radius) {
    nvg::Reset();
    nvg::BeginPath();
    nvg::FillColor(col);
    nvg::Circle(xy, radius);
    nvg::Fill();
    nvg::ClosePath();
}