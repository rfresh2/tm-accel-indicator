void Render()
{
    auto app = GetApp();

    auto visState = VehicleState::ViewingPlayerState();
    if (visState is null) {
        return;
    }
    bool isAccelerating = visState.InputGasPedal > 0;

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