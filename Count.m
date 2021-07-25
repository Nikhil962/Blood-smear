classdef count < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        TabGroup                     matlab.ui.container.TabGroup
        Step1Tab                     matlab.ui.container.Tab
        Step1Panel                   matlab.ui.container.Panel
        PreprocessingButton          matlab.ui.control.Button
        LoadimageButton              matlab.ui.control.Button
        UIAxes2                      matlab.ui.control.UIAxes
        UIAxes                       matlab.ui.control.UIAxes
        Step2Tab                     matlab.ui.container.Tab
        RBCPanel                     matlab.ui.container.Panel
        EditField2                   matlab.ui.control.NumericEditField
        CountRBCButton               matlab.ui.control.Button
        SegmentRBCButton             matlab.ui.control.Button
        WBCPanel                     matlab.ui.container.Panel
        EditField                    matlab.ui.control.NumericEditField
        CountWBCButton               matlab.ui.control.Button
        SegmentWBCButton             matlab.ui.control.Button
        UIAxes4                      matlab.ui.control.UIAxes
        UIAxes3                      matlab.ui.control.UIAxes
        AboutTab                     matlab.ui.container.Tab
        Button                       matlab.ui.control.Button
        CountingRBCandWBCcellsLabel  matlab.ui.control.Label
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create CountingRBCandWBCcellsLabel
            app.CountingRBCandWBCcellsLabel = uilabel(app.UIFigure);
            app.CountingRBCandWBCcellsLabel.BackgroundColor = [0.8 0.8 0.8];
            app.CountingRBCandWBCcellsLabel.HorizontalAlignment = 'center';
            app.CountingRBCandWBCcellsLabel.FontSize = 20;
            app.CountingRBCandWBCcellsLabel.FontWeight = 'bold';
            app.CountingRBCandWBCcellsLabel.Position = [1 432 640 49];
            app.CountingRBCandWBCcellsLabel.Text = 'Counting RBC and WBC cells';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.TabLocation = 'left';
            app.TabGroup.Position = [1 1 640 432];

            % Create Step1Tab
            app.Step1Tab = uitab(app.TabGroup);
            app.Step1Tab.Title = 'Step1';

            % Create UIAxes
            app.UIAxes = uiaxes(app.Step1Tab);
            app.UIAxes.Position = [273 217 300 213];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.Step1Tab);
            app.UIAxes2.Position = [273 1 300 217];

            % Create Step1Panel
            app.Step1Panel = uipanel(app.Step1Tab);
            app.Step1Panel.Title = 'Step1';
            app.Step1Panel.BackgroundColor = [0.8 0.8 0.8];
            app.Step1Panel.Position = [14 195 260 221];

            % Create LoadimageButton
            app.LoadimageButton = uibutton(app.Step1Panel, 'push');
            app.LoadimageButton.Position = [71 145 100 22];
            app.LoadimageButton.Text = 'Load image';

            % Create PreprocessingButton
            app.PreprocessingButton = uibutton(app.Step1Panel, 'push');
            app.PreprocessingButton.Position = [71 68 100 22];
            app.PreprocessingButton.Text = 'Preprocessing';

            % Create Step2Tab
            app.Step2Tab = uitab(app.TabGroup);
            app.Step2Tab.Title = 'Step2';

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.Step2Tab);
            app.UIAxes3.Position = [273 221 300 209];

            % Create UIAxes4
            app.UIAxes4 = uiaxes(app.Step2Tab);
            app.UIAxes4.Position = [273 1 300 217];

            % Create WBCPanel
            app.WBCPanel = uipanel(app.Step2Tab);
            app.WBCPanel.Title = 'WBC';
            app.WBCPanel.BackgroundColor = [0.8 0.8 0.8];
            app.WBCPanel.Position = [1 221 260 209];

            % Create SegmentWBCButton
            app.SegmentWBCButton = uibutton(app.WBCPanel, 'push');
            app.SegmentWBCButton.Position = [13 140 100 22];
            app.SegmentWBCButton.Text = 'Segment WBC';

            % Create CountWBCButton
            app.CountWBCButton = uibutton(app.WBCPanel, 'push');
            app.CountWBCButton.Position = [13 73 100 22];
            app.CountWBCButton.Text = 'Count WBC';

            % Create EditField
            app.EditField = uieditfield(app.WBCPanel, 'numeric');
            app.EditField.Position = [154 73 100 22];

            % Create RBCPanel
            app.RBCPanel = uipanel(app.Step2Tab);
            app.RBCPanel.Title = 'RBC';
            app.RBCPanel.BackgroundColor = [0.8 0.8 0.8];
            app.RBCPanel.Position = [1 1 260 221];

            % Create SegmentRBCButton
            app.SegmentRBCButton = uibutton(app.RBCPanel, 'push');
            app.SegmentRBCButton.Position = [13 132 100 22];
            app.SegmentRBCButton.Text = 'Segment RBC';

            % Create CountRBCButton
            app.CountRBCButton = uibutton(app.RBCPanel, 'push');
            app.CountRBCButton.Position = [13 65 100 22];
            app.CountRBCButton.Text = 'Count RBC';

            % Create EditField2
            app.EditField2 = uieditfield(app.RBCPanel, 'numeric');
            app.EditField2.Position = [154 65 100 22];

            % Create AboutTab
            app.AboutTab = uitab(app.TabGroup);
            app.AboutTab.Title = 'About';

            % Create Button
            app.Button = uibutton(app.AboutTab, 'push');
            app.Button.Icon = 'dg.PNG';
            app.Button.Position = [67 111 100 22];
            app.Button.Text = '';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = count

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
