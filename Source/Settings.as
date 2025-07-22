[Setting hidden]
bool S_Accel_Enabled = true;
[Setting hidden]
bool S_Brake_Enabled = false;
[Setting hidden]
float S_Accel_ScreenPosX = 0.5;
[Setting hidden]
float S_Accel_ScreenPosY = 0.8;
[Setting hidden]
float S_Accel_Size = 15.;
[Setting hidden]
vec4 S_Accel_Color = vec4(.123, 1, 0, 0.866);
[Setting hidden]
vec4 S_Brake_Color = vec4(1, 0.123, 0, 0.866);
[Setting hidden]
vec4 S_Accel_And_Brake_Color = vec4(1, 1, 0, 0.866);
[Setting hidden]
bool S_Preview = false;

[SettingsTab name="General" icon="KeyboardO" order="1"]
void Settings_RenderGeneral() {
    auto fullWidth = UI::GetWindowContentRegionWidth();
    UI::PushItemWidth(Math::Max(fullWidth * .5, 300.));

    S_Accel_Enabled = UI::Checkbox("Enable Acceleration Indicator", S_Accel_Enabled);
    S_Brake_Enabled = UI::Checkbox("Enable Brake Indicator", S_Brake_Enabled);

    S_Accel_ScreenPosX = Math::Clamp(UI::InputFloat("Position (X, Relative)", S_Accel_ScreenPosX, 0.0f), 0.0, 1.0);
    S_Accel_ScreenPosY = Math::Clamp(UI::InputFloat("Position (Y, Relative)", S_Accel_ScreenPosY, 0.0f), 0.0, 1.0);


    UI::Separator();
    S_Accel_Size = Math::Clamp(UI::InputFloat("Size (Radius)", S_Accel_Size, 1.0f), 1.0, 200.0);
    S_Preview = UI::Checkbox("Show Preview", S_Preview);

    S_Accel_Color = UI::InputColor4("Accelerator Color", S_Accel_Color);
    S_Brake_Color = UI::InputColor4("Brake Color", S_Brake_Color);
    S_Accel_And_Brake_Color = UI::InputColor4("Accelerator & Brake Color", S_Accel_And_Brake_Color);

    UI::PopItemWidth();
}
