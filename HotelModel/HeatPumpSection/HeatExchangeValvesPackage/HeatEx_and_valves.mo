within HotelModel.HeatPumpSection.HeatExchangeValvesPackage;
model HeatEx_and_valves
replaceable package MediumCW =
      Modelica.Media.Interfaces.PartialMedium "Medium for condenser water"
      annotation (choicesAllMatching = true);
  parameter Modelica.SIunits.MassFlowRate mWater_flow_nominal=10
    "Nominal mass flow rate of water";
  parameter Modelica.SIunits.Pressure dp_nominal=100
    "Nominal pressure difference";
  Buildings.Fluid.HeatExchangers.ConstantEffectiveness hex(
    redeclare package Medium1 = MediumCW,
    redeclare package Medium2 = MediumCW,
    m1_flow_nominal=mWater_flow_nominal,
    m2_flow_nominal=mWater_flow_nominal,
    dp1_nominal=dp_nominal,
    dp2_nominal=dp_nominal)
    "Heat exchanger corresponding to the connection between the heat pump and the domestic water"
    annotation (Placement(transformation(extent={{-10,-44},{10,-24}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear hexval1(
    redeclare package Medium = MediumCW,
    m_flow_nominal=mWater_flow_nominal,
    dpValve_nominal=dp_nominal) "Heat Exchanger valve 1" annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-40,0})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear valbyp(
    redeclare package Medium = MediumCW,
    m_flow_nominal=mWater_flow_nominal,
    dpValve_nominal=dp_nominal) "Heat exchange valve bypass"
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear hexval2(
    redeclare package Medium = MediumCW,
    m_flow_nominal=mWater_flow_nominal,
    dpValve_nominal=dp_nominal) "Heat Exchange valve 2" annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,0})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1
    "Fluid connector a (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{90,30},{110,50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b2
    "Fluid connector b2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a2
    "Fluid connector a2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
  Modelica.Blocks.Interfaces.RealInput ValCtrl1
    "Signal controling the first heat exchange valve" annotation (
      Placement(transformation(
        extent={{12,-12},{-12,12}},
        rotation=90,
        origin={-60,112})));
  Modelica.Blocks.Interfaces.RealInput BypValCtrl
    "Signal controling the bypass valve"     annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={60,112})));
  Modelica.Blocks.Interfaces.RealInput ValCtrl2
    "Signal controling the second heat exchange valve" annotation (
      Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,112})));
equation
  connect(hex.port_a1, hexval1.port_b) annotation (Line(
      points={{-10,-28},{-40,-28},{-40,-10}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(hexval1.port_a, valbyp.port_a) annotation (Line(
      points={{-40,10},{-40,40},{-10,40}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(valbyp.port_b, hexval2.port_a) annotation (Line(
      points={{10,40},{40,40},{40,10}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(hexval2.port_b, hex.port_b1) annotation (Line(
      points={{40,-10},{40,-28},{10,-28}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(valbyp.port_a, port_a1) annotation (Line(
      points={{-10,40},{-100,40}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(valbyp.port_b, port_b1) annotation (Line(
      points={{10,40},{100,40}},
      color={0,127,255},
      smooth=Smooth.None,
      arrow={Arrow.Filled,Arrow.None},
      thickness=1));
  connect(hex.port_b2, port_b2) annotation (Line(
      points={{-10,-40},{-100,-40}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(hex.port_a2, port_a2) annotation (Line(
      points={{10,-40},{100,-40}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(hexval1.y, ValCtrl1) annotation (Line(
      points={{-52,0},{-60,0},{-60,112}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(valbyp.y,BypValCtrl)  annotation (Line(
      points={{0,52},{0,60},{60,60},{60,112}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(hexval2.y, ValCtrl2) annotation (Line(
      points={{28,6.66134e-016},{20,6.66134e-016},{20,80},{0,80},{0,112}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));

  connect(port_b2, port_b2) annotation (Line(
      points={{-100,-40},{-100,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),        graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Rectangle(
          extent={{-94,48},{-60,32}},
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-94,-32},{-60,-48}},
          pattern=LinePattern.None,
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{60,48},{94,32}},
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{60,-32},{94,-48}},
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-60,60},{60,-60}},
          lineThickness=1,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Text(
          extent={{-40,-68},{40,-88}},
          pattern=LinePattern.None,
          lineThickness=1,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255},
          textString="%name"),
        Line(
          points={{-60,90},{-60,80},{-40,80},{-40,60}},
          color={0,0,127},
          pattern=LinePattern.DashDot,
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{0,90},{0,60}},
          color={0,0,127},
          pattern=LinePattern.DashDot,
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{60,90},{60,80},{40,80},{40,60}},
          color={0,0,127},
          pattern=LinePattern.DashDot,
          thickness=0.5,
          smooth=Smooth.None)}));
end HeatEx_and_valves;
