public class SettingsCells {

    public var settingCellLabel: String
    public var settingsOption: settingsCellsOptions

    public init(_ option: settingsCellsOptions, _ actionName: String) {

        settingCellLabel = actionName
        settingsOption = option
    }
}

