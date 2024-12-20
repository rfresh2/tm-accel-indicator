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

    // Memory address debug
    // for (uint i = 0x1140; i < 0x1180; i++) {
    //     UI::Text(Text::Format("0x%04x", i) + " = " + Dev::GetOffsetUint32(arena, i));
    // }
    
    bool isAccelerating = Dev::GetOffsetUint32(arena, 0x1154) & 4 > 0;

    if (isAccelerating || S_Preview) {
        auto pos = vec2(Draw::GetWidth(), Draw::GetHeight()) * vec2(S_Accel_ScreenPosX, S_Accel_ScreenPosY);
        nvgCircle(pos, S_Accel_Color, S_Accel_Size);
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