@testset "Conversions" begin
  @testset "Basic" begin
    @testset "Cartesian <> Polar" begin
      c1 = Cartesian(T(1), T(1))
      c2 = convert(Polar, c1)
      @test isapprox(c2, Polar(T(√2), T(π / 4)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(-T(1), T(1))
      c2 = convert(Polar, c1)
      @test isapprox(c2, Polar(T(√2), T(3π / 4)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(-T(1), -T(1))
      c2 = convert(Polar, c1)
      @test isapprox(c2, Polar(T(√2), T(5π / 4)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(1), -T(1))
      c2 = convert(Polar, c1)
      @test isapprox(c2, Polar(T(√2), T(7π / 4)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(0), T(1))
      c2 = convert(Polar, c1)
      @test isapprox(c2, Polar(T(1), T(π / 2)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(0), -T(1))
      c2 = convert(Polar, c1)
      @test isapprox(c2, Polar(T(1), T(3π / 2)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(1), T(0))
      c2 = convert(Polar, c1)
      @test isapprox(c2, Polar(T(1), T(0)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(-T(1), T(0))
      c2 = convert(Polar, c1)
      @test isapprox(c2, Polar(T(1), T(π)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = Cartesian(T(1), T(1))
      c2 = Polar(T(√2), T(π / 4))
      @inferred convert(Polar, c1)
      @inferred convert(Cartesian, c2)
    end

    @testset "Cartesian <> Cylindrical" begin
      c1 = Cartesian(T(1), T(1), T(1))
      c2 = convert(Cylindrical, c1)
      @test isapprox(c2, Cylindrical(T(√2), T(π / 4), T(1)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(-T(1), T(1), T(1))
      c2 = convert(Cylindrical, c1)
      @test isapprox(c2, Cylindrical(T(√2), T(3π / 4), T(1)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(-T(1), -T(1), T(1))
      c2 = convert(Cylindrical, c1)
      @test isapprox(c2, Cylindrical(T(√2), T(5π / 4), T(1)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(1), -T(1), T(1))
      c2 = convert(Cylindrical, c1)
      @test isapprox(c2, Cylindrical(T(√2), T(7π / 4), T(1)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(0), T(1), T(1))
      c2 = convert(Cylindrical, c1)
      @test isapprox(c2, Cylindrical(T(1), T(π / 2), T(1)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(0), -T(1), T(1))
      c2 = convert(Cylindrical, c1)
      @test isapprox(c2, Cylindrical(T(1), T(3π / 2), T(1)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(1), T(0), T(1))
      c2 = convert(Cylindrical, c1)
      @test isapprox(c2, Cylindrical(T(1), T(0), T(1)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(-T(1), T(0), T(1))
      c2 = convert(Cylindrical, c1)
      @test isapprox(c2, Cylindrical(T(1), T(π), T(1)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = Cartesian(T(1), T(1), T(1))
      c2 = Cylindrical(T(√2), T(π / 4), T(1))
      @inferred convert(Cylindrical, c1)
      @inferred convert(Cartesian, c2)
    end

    @testset "Cartesian <> Spherical" begin
      c1 = Cartesian(T(1), T(1), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√3), atan(T(√2)), T(π / 4)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(-T(1), T(1), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√3), atan(T(√2)), T(3π / 4)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(-T(1), -T(1), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√3), atan(T(√2)), T(5π / 4)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(1), -T(1), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√3), atan(T(√2)), T(7π / 4)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(0), T(1), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√2), T(π / 4), T(π / 2)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(0), -T(1), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√2), T(π / 4), T(3π / 2)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(T(1), T(0), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√2), T(π / 4), T(0)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      c1 = Cartesian(-T(1), T(0), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√2), T(π / 4), T(π)))
      c3 = convert(Cartesian, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = Cartesian(T(1), T(1), T(1))
      c2 = Spherical(T(√3), atan(T(√2)), T(π / 4))
      @inferred convert(Spherical, c1)
      @inferred convert(Cartesian, c2)
    end

    @testset "Cylindrical <> Spherical" begin
      c1 = Cylindrical(T(√2), T(π / 4), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√3), atan(T(√2)), T(π / 4)))
      c3 = convert(Cylindrical, c2)
      @test isapprox(c3, c1)

      c1 = Cylindrical(T(√2), T(3π / 4), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√3), atan(T(√2)), T(3π / 4)))
      c3 = convert(Cylindrical, c2)
      @test isapprox(c3, c1)

      c1 = Cylindrical(T(√2), T(5π / 4), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√3), atan(T(√2)), T(5π / 4)))
      c3 = convert(Cylindrical, c2)
      @test isapprox(c3, c1)

      c1 = Cylindrical(T(√2), T(7π / 4), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√3), atan(T(√2)), T(7π / 4)))
      c3 = convert(Cylindrical, c2)
      @test isapprox(c3, c1)

      c1 = Cylindrical(T(1), T(π / 2), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√2), T(π / 4), T(π / 2)))
      c3 = convert(Cylindrical, c2)
      @test isapprox(c3, c1)

      c1 = Cylindrical(T(1), T(3π / 2), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√2), T(π / 4), T(3π / 2)))
      c3 = convert(Cylindrical, c2)
      @test isapprox(c3, c1)

      c1 = Cylindrical(T(1), T(0), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√2), T(π / 4), T(0)))
      c3 = convert(Cylindrical, c2)
      @test isapprox(c3, c1)

      c1 = Cylindrical(T(1), T(π), T(1))
      c2 = convert(Spherical, c1)
      @test isapprox(c2, Spherical(T(√2), T(π / 4), T(π)))
      c3 = convert(Cylindrical, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = Cylindrical(T(√2), T(π / 4), T(1))
      c2 = Spherical(T(√3), atan(T(√2)), T(π / 4))
      @inferred convert(Spherical, c1)
      @inferred convert(Cylindrical, c2)
    end

    @testset "Datum conversion" begin
      # WGS84 (G1762) to ITRF2008
      c1 = Cartesian{WGS84{1762}}(T(0), T(0), T(0))
      c2 = convert(Cartesian{ITRF{2008}}, c1)
      @test isapprox(c2, Cartesian{ITRF{2008}}(T(0), T(0), T(0)))

      c1 = Cartesian{WGS84{1762}}(T(1), T(1), T(1))
      c2 = convert(Cartesian{ITRF{2008}}, c1)
      @test isapprox(c2, Cartesian{ITRF{2008}}(T(1), T(1), T(1)))

      # ITRF2008 to ITRF2020
      c1 = Cartesian{ITRF{2008}}(T(0), T(0), T(0))
      c2 = convert(Cartesian{ITRF{2020}}, c1)
      @test isapprox(c2, Cartesian{ITRF{2020}}(T(-0.0002), T(-0.002), T(-0.0023)))

      c1 = Cartesian{ITRF{2008}}(T(1), T(1), T(1))
      c2 = convert(Cartesian{ITRF{2020}}, c1)
      @test isapprox(c2, Cartesian{ITRF{2020}}(T(0.9998000005900001), T(0.99800000059), T(0.9977000005900001)))

      c1 = Cartesian{WGS84Latest}(T(0), T(0), T(0))
      c2 = convert(Cartesian{WGS84Latest}, c1)
      @test c1 === c2

      c1 = Cartesian{WGS84Latest}(T(0), T(0))
      c2 = convert(Cartesian{WGS84Latest}, c1)
      @test c1 === c2

      c1 = Cartesian{WGS84{1762}}(T(0), T(0), T(0))
      c2 = Cartesian{ITRF{2008}}(T(0), T(0), T(0))
      @inferred convert(Cartesian{ITRF{2008}}, c1)
      @inferred convert(Cartesian{ITRF{2020}}, c2)

      # NAD27 to WGS84 (2296)
      c1 = Cartesian{NAD27}(T(0), T(0), T(0))
      c2 = convert(Cartesian{WGS84{2296}}, c1)
      @test isapprox(c2, Cartesian{WGS84{2296}}(T(-3.0), T(142.0), T(183.0)))

      # other basic CRS
      c1 = Cylindrical{WGS84{1762}}(T(0), T(0), T(0))
      c2 = convert(Cylindrical{ITRF{2008}}, c1)
      @test isapprox(c2, Cylindrical{ITRF{2008}}(T(0), T(0), T(0)))

      c1 = Spherical{WGS84{1762}}(T(0), T(0), T(0))
      c2 = convert(Spherical{ITRF{2008}}, c1)
      @test isapprox(c2, Spherical{ITRF{2008}}(T(0), T(0), T(0)))

      c1 = Cylindrical{ITRF{2008}}(T(0), T(0), T(0))
      c2 = convert(Cylindrical{ITRF{2020}}, c1)
      @test isapprox(c2, Cylindrical{ITRF{2020}}(T(0.002009975124224178), T(4.612720327893528), T(-0.0023)))

      c1 = Spherical{ITRF{2008}}(T(0), T(0), T(0))
      c2 = convert(Spherical{ITRF{2020}}, c1)
      @test isapprox(c2, Spherical{ITRF{2020}}(T(0.003054504869860253), T(2.4233847393369694), T(4.612720327893528)))
    end
  end

  @testset "Geographic" begin
    @testset "LatLon <> GeocentricLatLon" begin
      c1 = LatLon(T(30), T(40))
      c2 = convert(GeocentricLatLon, c1)
      @test isapprox(c2, GeocentricLatLon(T(29.833635809829065), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(35), T(40))
      c2 = convert(GeocentricLatLon, c1)
      @test isapprox(c2, GeocentricLatLon(T(34.819388702349606), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(40), T(40))
      c2 = convert(GeocentricLatLon, c1)
      @test isapprox(c2, GeocentricLatLon(T(39.810610551928434), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(30), T(40))
      c2 = convert(GeocentricLatLon, c1)
      @test isapprox(c2, GeocentricLatLon(-T(29.833635809829065), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(35), T(40))
      c2 = convert(GeocentricLatLon, c1)
      @test isapprox(c2, GeocentricLatLon(-T(34.819388702349606), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(40), T(40))
      c2 = convert(GeocentricLatLon, c1)
      @test isapprox(c2, GeocentricLatLon(-T(39.810610551928434), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(30), T(40))
      c2 = GeocentricLatLon(T(29.833635809829065), T(40))
      @inferred convert(GeocentricLatLon, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> AuthalicLatLon" begin
      c1 = LatLon(T(30), T(40))
      c2 = convert(AuthalicLatLon, c1)
      @test isapprox(c2, AuthalicLatLon(T(29.888997034459567), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(35), T(40))
      c2 = convert(AuthalicLatLon, c1)
      @test isapprox(c2, AuthalicLatLon(T(34.87951854973729), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(40), T(40))
      c2 = convert(AuthalicLatLon, c1)
      @test isapprox(c2, AuthalicLatLon(T(39.87369373453432), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(30), T(40))
      c2 = convert(AuthalicLatLon, c1)
      @test isapprox(c2, AuthalicLatLon(-T(29.888997034459567), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(35), T(40))
      c2 = convert(AuthalicLatLon, c1)
      @test isapprox(c2, AuthalicLatLon(-T(34.87951854973729), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(40), T(40))
      c2 = convert(AuthalicLatLon, c1)
      @test isapprox(c2, AuthalicLatLon(-T(39.87369373453432), T(40)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(30), T(40))
      c2 = AuthalicLatLon(T(29.888997034459567), T(40))
      @inferred convert(AuthalicLatLon, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> LatLonAlt" begin
      c1 = LatLon(T(30), T(40))
      c2 = convert(LatLonAlt, c1)
      @test isapprox(c2, LatLonAlt(T(30), T(40), T(0)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # datum conversion
      # altitude can only be calculated accurately using Float64
      if T == Float64
        # WGS84 (G1762) to ITRF2008
        c1 = LatLon{WGS84{1762}}(T(30), T(40))
        c2 = convert(LatLonAlt{ITRF{2008}}, c1)
        @test isapprox(c2, LatLonAlt{ITRF{2008}}(T(30), T(40), T(2.613849937915802e-5)))
        c3 = convert(LatLon{WGS84{1762}}, c2)
        @test isapprox(c3, c1)

        c1 = LatLon{WGS84{1762}}(T(35), T(45))
        c2 = convert(LatLonAlt{ITRF{2008}}, c1)
        @test isapprox(c2, LatLonAlt{ITRF{2008}}(T(35), T(45), T(3.440864384174347e-5)))
        c3 = convert(LatLon{WGS84{1762}}, c2)
        @test isapprox(c3, c1)

        # ITRF2008 to ITRF2020
        c1 = LatLon{ITRF{2008}}(T(30), T(40))
        c2 = convert(LatLonAlt{ITRF{2020}}, c1)
        @test isapprox(
          c2,
          LatLonAlt{ITRF{2020}}(T(29.999999988422587), T(39.99999998545356), T(-0.0024597514420747757))
        )
        c3 = convert(LatLon{ITRF{2008}}, c2)
        @test isapprox(c3, c1)

        c1 = LatLon{ITRF{2008}}(T(35), T(45))
        c2 = convert(LatLonAlt{ITRF{2020}}, c1)
        @test isapprox(c2, LatLonAlt{ITRF{2020}}(T(34.99999999095351), T(44.99999998605742), T(-0.002657238394021988)))
        c3 = convert(LatLon{ITRF{2008}}, c2)
        @test isapprox(c3, c1)
      end

      # type stability
      c1 = LatLon(T(30), T(40))
      c2 = LatLonAlt(T(30), T(40), T(0))
      c3 = LatLon{WGS84{1762}}(T(30), T(40))
      c4 = LatLonAlt{ITRF{2008}}(T(30), T(40), T(0))
      @inferred convert(LatLonAlt, c1)
      @inferred convert(LatLon, c2)
      @inferred convert(LatLonAlt{ITRF{2008}}, c3)
      @inferred convert(LatLon{WGS84{1762}}, c4)
    end

    @testset "LatLonAlt <> GeocentricLatLon" begin
      c1 = LatLonAlt(T(30), T(40), T(0))
      c2 = convert(GeocentricLatLon, c1)
      @test isapprox(c2, GeocentricLatLon(T(29.833635809829065), T(40)))
      c3 = convert(LatLonAlt, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLonAlt(T(30), T(40), T(0))
      c2 = GeocentricLatLon(T(29.833635809829065), T(40))
      @inferred convert(GeocentricLatLon, c1)
      @inferred convert(LatLonAlt, c2)
    end

    @testset "LatLonAlt <> GeocentricLatLonAlt" begin
      c1 = LatLonAlt(T(30), T(40), T(0))
      c2 = convert(GeocentricLatLonAlt, c1)
      @test isapprox(c2, GeocentricLatLonAlt(T(29.833635809829065), T(40), T(0)))
      c3 = convert(LatLonAlt, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLonAlt(T(30), T(40), T(0))
      c2 = GeocentricLatLonAlt(T(29.833635809829065), T(40), T(0))
      @inferred convert(GeocentricLatLonAlt, c1)
      @inferred convert(LatLonAlt, c2)
    end

    @testset "LatLon <> Cartesian" begin
      c1 = LatLon(T(30), T(40))
      c2 = convert(Cartesian, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(4234890.278665873), T(3553494.8709047823), T(3170373.735383637)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(35), T(45))
      c2 = convert(Cartesian, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(3698470.287205801), T(3698470.2872058), T(3637866.909378095)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(40), T(50))
      c2 = convert(Cartesian, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(3144971.82314589), T(3748031.468841677), T(4077985.572200376)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(30), -T(40))
      c2 = convert(Cartesian, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(4234890.278665873), -T(3553494.8709047823), -T(3170373.735383637)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(35), T(45))
      c2 = convert(Cartesian, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(3698470.287205801), T(3698470.2872058), -T(3637866.909378095)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(40), -T(50))
      c2 = convert(Cartesian, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(3144971.82314589), -T(3748031.468841677), T(4077985.572200376)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(30), T(40))
      c2 = Cartesian{WGS84Latest}(T(4234890.278665873), T(3553494.8709047823), T(3170373.735383637))
      @inferred convert(Cartesian, c1)
      @inferred convert(LatLon, c2)
    end

    # altitude can only be calculated accurately using Float64
    if T === Float64
      @testset "LatLonAlt <> Cartesian" begin
        c1 = LatLonAlt(T(30), T(40), T(0))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(4234890.278665873), T(3553494.8709047823), T(3170373.735383637)))
        c3 = convert(LatLonAlt, c2)
        @test isapprox(c3, c1)

        c1 = LatLonAlt(T(35), T(45), T(100))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(3698528.2100023343), T(3698528.2100023334), T(3637924.26702173)))
        c3 = convert(LatLonAlt, c2)
        @test isapprox(c3, c1)

        c1 = LatLonAlt(T(40), T(50), T(200))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(3145070.3039211915), T(3748148.8336594435), T(4078114.1297223135)))
        c3 = convert(LatLonAlt, c2)
        @test isapprox(c3, c1)

        c1 = LatLonAlt(-T(30), -T(40), T(0))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(4234890.278665873), -T(3553494.8709047823), -T(3170373.735383637)))
        c3 = convert(LatLonAlt, c2)
        @test isapprox(c3, c1)

        c1 = LatLonAlt(-T(35), T(45), T(100))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(3698528.2100023343), T(3698528.2100023334), -T(3637924.26702173)))
        c3 = convert(LatLonAlt, c2)
        @test isapprox(c3, c1)

        c1 = LatLonAlt(T(40), -T(50), T(200))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(3145070.3039211915), -T(3748148.8336594435), T(4078114.1297223135)))
        c3 = convert(LatLonAlt, c2)
        @test isapprox(c3, c1)

        # type stability
        c1 = LatLonAlt(T(30), T(40), T(0))
        c2 = Cartesian{WGS84Latest}(T(4234890.278665873), T(3553494.8709047823), T(3170373.735383637))
        @inferred convert(Cartesian, c1)
        @inferred convert(LatLonAlt, c2)
      end

      @testset "GeocentricLatLonAlt <> Cartesian" begin
        c1 = GeocentricLatLonAlt(T(30), T(40), T(0))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(4227784.905275363), T(3547532.754713428), T(3186385.300568595)))
        c3 = convert(GeocentricLatLonAlt, c2)
        @test isapprox(c3, c1)

        c1 = GeocentricLatLonAlt(T(35), T(45), T(100))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(3690364.254026674), T(3690364.2540266733), T(3654357.744678035)))
        c3 = convert(GeocentricLatLonAlt, c2)
        @test isapprox(c3, c1)

        c1 = GeocentricLatLonAlt(T(40), T(50), T(200))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(3136354.020667129), T(3737761.1717773457), T(4094220.2645078264)))
        c3 = convert(GeocentricLatLonAlt, c2)
        @test isapprox(c3, c1)

        c1 = GeocentricLatLonAlt(-T(30), -T(40), T(0))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(4227784.905275363), -T(3547532.754713428), -T(3186385.300568595)))
        c3 = convert(GeocentricLatLonAlt, c2)
        @test isapprox(c3, c1)

        c1 = GeocentricLatLonAlt(-T(35), T(45), T(100))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(3690364.254026674), T(3690364.2540266733), -T(3654357.744678035)))
        c3 = convert(GeocentricLatLonAlt, c2)
        @test isapprox(c3, c1)

        c1 = GeocentricLatLonAlt(T(40), -T(50), T(200))
        c2 = convert(Cartesian, c1)
        @test isapprox(c2, Cartesian{WGS84Latest}(T(3136354.020667129), -T(3737761.1717773457), T(4094220.2645078264)))
        c3 = convert(GeocentricLatLonAlt, c2)
        @test isapprox(c3, c1)

        # type stability
        c1 = GeocentricLatLonAlt(T(30), T(40), T(0))
        c2 = Cartesian{WGS84Latest}(T(4227784.905275363), T(3547532.754713428), T(3186385.300568595))
        @inferred convert(Cartesian, c1)
        @inferred convert(LatLonAlt, c2)
      end

      @testset "LatLonAlt: Datum conversion" begin
        # WGS84 (G1762) to ITRF2008
        c1 = LatLonAlt{WGS84{1762}}(T(30), T(40), T(1))
        c2 = convert(LatLonAlt{ITRF{2008}}, c1)
        @test isapprox(c2, LatLonAlt{ITRF{2008}}(T(30), T(40), T(1.0000261394307017)))
        c3 = convert(LatLonAlt{WGS84{1762}}, c2)
        @test isapprox(c3, c1)

        c1 = LatLonAlt{WGS84{1762}}(T(35), T(45), T(1))
        c2 = convert(LatLonAlt{ITRF{2008}}, c1)
        @test isapprox(c2, LatLonAlt{ITRF{2008}}(T(35), T(45), T(1.0000344086438417)))
        c3 = convert(LatLonAlt{WGS84{1762}}, c2)
        @test isapprox(c3, c1)

        # ITRF2008 to ITRF2020
        c1 = LatLonAlt{ITRF{2008}}(T(30), T(40), T(1))
        c2 = convert(LatLonAlt{ITRF{2020}}, c1)
        @test isapprox(c2, LatLonAlt{ITRF{2020}}(T(29.999999988422587), T(39.99999998545356), T(0.9975402476266026)))
        c3 = convert(LatLonAlt{ITRF{2008}}, c2)
        @test isapprox(c3, c1)

        c1 = LatLonAlt{ITRF{2008}}(T(35), T(45), T(1))
        c2 = convert(LatLonAlt{ITRF{2020}}, c1)
        @test isapprox(c2, LatLonAlt{ITRF{2020}}(T(34.99999999095351), T(44.99999998605742), T(0.9973427625373006)))
        c3 = convert(LatLonAlt{ITRF{2008}}, c2)
        @test isapprox(c3, c1)

        c1 = LatLonAlt{WGS84{1762}}(T(30), T(40), T(1))
        c2 = LatLonAlt{ITRF{2008}}(T(30), T(40), T(1))
        @inferred convert(LatLonAlt{ITRF{2008}}, c1)
        @inferred convert(LatLonAlt{ITRF{2020}}, c2)
      end

      @testset "GeocentricLatLonAlt: Datum conversion" begin
        # WGS84 (G1762) to ITRF2008
        c1 = GeocentricLatLonAlt{WGS84{1762}}(T(30), T(40), T(1))
        c2 = convert(GeocentricLatLonAlt{ITRF{2008}}, c1)
        @test isapprox(c2, GeocentricLatLonAlt{ITRF{2008}}(T(30), T(40), T(1.0000264029949903)))
        c3 = convert(GeocentricLatLonAlt{WGS84{1762}}, c2)
        @test isapprox(c3, c1)

        c1 = GeocentricLatLonAlt{WGS84{1762}}(T(35), T(45), T(1))
        c2 = convert(GeocentricLatLonAlt{ITRF{2008}}, c1)
        @test isapprox(c2, GeocentricLatLonAlt{ITRF{2008}}(T(35), T(45), T(1.0000347206369042)))
        c3 = convert(GeocentricLatLonAlt{WGS84{1762}}, c2)
        @test isapprox(c3, c1)

        # ITRF2008 to ITRF2020
        c1 = GeocentricLatLonAlt{ITRF{2008}}(T(30), T(40), T(1))
        c2 = convert(GeocentricLatLonAlt{ITRF{2020}}, c1)
        @test isapprox(
          c2,
          GeocentricLatLonAlt{ITRF{2020}}(T(29.999999988422587), T(39.99999998545356), T(0.997536551207304))
        )
        c3 = convert(GeocentricLatLonAlt{ITRF{2008}}, c2)
        @test isapprox(c3, c1)

        c1 = GeocentricLatLonAlt{ITRF{2008}}(T(35), T(45), T(1))
        c2 = convert(GeocentricLatLonAlt{ITRF{2020}}, c1)
        @test isapprox(
          c2,
          GeocentricLatLonAlt{ITRF{2020}}(T(34.99999999095351), T(44.99999998605742), T(0.9973396398127079))
        )
        c3 = convert(GeocentricLatLonAlt{ITRF{2008}}, c2)
        @test isapprox(c3, c1)

        c1 = GeocentricLatLonAlt{WGS84{1762}}(T(30), T(40), T(1))
        c2 = GeocentricLatLonAlt{ITRF{2008}}(T(30), T(40), T(1))
        @inferred convert(GeocentricLatLonAlt{ITRF{2008}}, c1)
        @inferred convert(GeocentricLatLonAlt{ITRF{2020}}, c2)
      end
    end

    @testset "LatLon: Datum conversion" begin
      # NAD83 to WGS84
      c1 = LatLon{NAD83}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(30), T(40)))
      c3 = convert(LatLon{NAD83}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{NAD83}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(35), T(45)))
      c3 = convert(LatLon{NAD83}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G1762) to ITRF2008
      c1 = LatLon{WGS84{1762}}(T(30), T(40))
      c2 = convert(LatLon{ITRF{2008}}, c1)
      @test isapprox(c2, LatLon{ITRF{2008}}(T(30), T(40)))
      c3 = convert(LatLon{WGS84{1762}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{1762}}(T(35), T(45))
      c2 = convert(LatLon{ITRF{2008}}, c1)
      @test isapprox(c2, LatLon{ITRF{2008}}(T(35), T(45)))
      c3 = convert(LatLon{WGS84{1762}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G2139) to ITRF2014
      c1 = LatLon{WGS84{2139}}(T(30), T(40))
      c2 = convert(LatLon{ITRF{2014}}, c1)
      @test isapprox(c2, LatLon{ITRF{2014}}(T(30), T(40)))
      c3 = convert(LatLon{WGS84{2139}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{2139}}(T(35), T(45))
      c2 = convert(LatLon{ITRF{2014}}, c1)
      @test isapprox(c2, LatLon{ITRF{2014}}(T(35), T(45)))
      c3 = convert(LatLon{WGS84{2139}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G2296) to ITRF2020
      c1 = LatLon{WGS84{2296}}(T(30), T(40))
      c2 = convert(LatLon{ITRF{2020}}, c1)
      @test isapprox(c2, LatLon{ITRF{2020}}(T(30), T(40)))
      c3 = convert(LatLon{WGS84{2296}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{2296}}(T(35), T(45))
      c2 = convert(LatLon{ITRF{2020}}, c1)
      @test isapprox(c2, LatLon{ITRF{2020}}(T(35), T(45)))
      c3 = convert(LatLon{WGS84{2296}}, c2)
      @test isapprox(c3, c1)

      # NAD27 to WGS84
      c1 = LatLon{NAD27}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(29.999172812878406), T(40.00114734092287)))
      c3 = convert(LatLon{NAD27}, c2)
      @test isapprox(c3, c1)

      # Carthage to WGS84
      c1 = LatLon{Carthage}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(30.00153253176913), T(40.00179973969016)))
      c3 = convert(LatLon{Carthage}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{Carthage}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(35.001164857937006), T(45.00208363872234)))
      c3 = convert(LatLon{Carthage}, c2)
      @test isapprox(c3, c1)

      # GGRS87 to WGS84
      c1 = LatLon{GGRS87}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(30.002400431894902), T(40.00192535096667)))
      c3 = convert(LatLon{GGRS87}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{GGRS87}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(35.0022781947901), T(45.002127518092834)))
      c3 = convert(LatLon{GGRS87}, c2)
      @test isapprox(c3, c1)

      # SAD69 to WGS84
      # note: the results differ from PROJ because we use the default transformation listed in EPSG.io,
      # which does not appear to be the case in PROJ
      # transformation list: https://epsg.io/4618
      # default transformation: https://epsg.org/transformation_1864/SAD69-to-WGS-84-1.html
      c1 = LatLon{SAD69}(T(5), T(-45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(4.999662038651082), T(-45.000357065414555)))
      c3 = convert(LatLon{SAD69}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{SAD69}(T(10), T(-40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(9.999702676265935), T(-40.00032719063254)))
      c3 = convert(LatLon{SAD69}, c2)
      @test isapprox(c3, c1)

      # SAD69 to SIRGAS2000
      c1 = LatLon{SAD69}(T(5), T(-45))
      c2 = convert(LatLon{SIRGAS2000}, c1)
      @test isapprox(c2, LatLon{SIRGAS2000}(T(4.99969445550929), T(-45.00040469598622)))
      c3 = convert(LatLon{SAD69}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{SAD69}(T(-10), T(-40))
      c2 = convert(LatLon{SIRGAS2000}, c1)
      @test isapprox(c2, LatLon{SIRGAS2000}(T(-10.00042337668094), T(-40.00036774834545)))
      c3 = convert(LatLon{SAD69}, c2)
      @test isapprox(c3, c1)

      # Hermannskogel to WGS84
      c1 = LatLon{Hermannskogel}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(30.002491990948382), T(39.99756285140804)))
      c3 = convert(LatLon{Hermannskogel}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{Hermannskogel}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(35.00226854367654), T(44.996794271771755)))
      c3 = convert(LatLon{Hermannskogel}, c2)
      @test isapprox(c3, c1)

      # Ire65 to WGS84
      c1 = LatLon{Ire65}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(30.003595375684984), T(39.99572206332302)))
      c3 = convert(LatLon{Ire65}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{Ire65}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(35.003385379949535), T(44.99524677680064)))
      c3 = convert(LatLon{Ire65}, c2)
      @test isapprox(c3, c1)

      # NZGD1949 to WGS84
      c1 = LatLon{NZGD1949}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(30.000667173416794), T(39.99980114703305)))
      c3 = convert(LatLon{NZGD1949}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{NZGD1949}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(35.00052502406383), T(44.999734233826786)))
      c3 = convert(LatLon{NZGD1949}, c2)
      @test isapprox(c3, c1)

      # NZGD2000 to WGS84
      c1 = LatLon{NZGD2000}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(30.000000001862645), T(40.00000000023283)))
      c3 = convert(LatLon{NZGD2000}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{NZGD2000}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(35.000000001862645), T(45.000000001396984)))
      c3 = convert(LatLon{NZGD2000}, c2)
      @test isapprox(c3, c1)

      # OSGB36 to WGS84
      c1 = LatLon{OSGB36}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(30.003642624158758), T(39.996222132850185)))
      c3 = convert(LatLon{OSGB36}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{OSGB36}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(35.003474099905354), T(44.99575175081459)))
      c3 = convert(LatLon{OSGB36}, c2)
      @test isapprox(c3, c1)

      # Potsdam to WGS84
      c1 = LatLon{Potsdam}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(30.001530921141082), T(39.99588940866917)))
      c3 = convert(LatLon{Potsdam}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{Potsdam}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(35.00122407077783), T(44.995222349198244)))
      c3 = convert(LatLon{Potsdam}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G0) to WGS84 (G730)
      c1 = LatLon{WGS84{0}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{730}}, c1)
      @test isapprox(c2, LatLon{WGS84{730}}(T(29.99999721267756), T(40.00000478084946)))
      c3 = convert(LatLon{WGS84{0}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{0}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{730}}, c1)
      @test isapprox(c2, LatLon{WGS84{730}}(T(34.99999640829469), T(45.00000499945162)))
      c3 = convert(LatLon{WGS84{0}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G730) to WGS84 (G873)
      c1 = LatLon{WGS84{730}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{873}}, c1)
      @test isapprox(c2, LatLon{WGS84{873}}(T(30.000000224982575), T(40.00000000620856)))
      c3 = convert(LatLon{WGS84{730}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{730}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{873}}, c1)
      @test isapprox(c2, LatLon{WGS84{873}}(T(35.000000235106576), T(45.0000000309835)))
      c3 = convert(LatLon{WGS84{730}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G1150) to WGS84 (G1762)
      c1 = LatLon{WGS84{1150}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(30.00000016323448), T(40.000000079668816)))
      c3 = convert(LatLon{WGS84{1150}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{1150}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(35.00000015214448), T(45.000000085204626)))
      c3 = convert(LatLon{WGS84{1150}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G1674) to WGS84 (G1762)
      c1 = LatLon{WGS84{1674}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(29.99999993150578), T(39.99999995021196)))
      c3 = convert(LatLon{WGS84{1674}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{1674}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(34.999999928128716), T(44.99999994866557)))
      c3 = convert(LatLon{WGS84{1674}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G1762) to WGS84 (G2139)
      c1 = LatLon{WGS84{1762}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2139}}, c1)
      @test isapprox(c2, LatLon{WGS84{2139}}(T(30.00000004814441), T(39.9999998910735)))
      c3 = convert(LatLon{WGS84{1762}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{1762}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{2139}}, c1)
      @test isapprox(c2, LatLon{WGS84{2139}}(T(35.00000004680104), T(44.999999888560545)))
      c3 = convert(LatLon{WGS84{1762}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G2139) to WGS84 (G2296)
      c1 = LatLon{WGS84{2139}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(29.99999995516499), T(40.00000001716362)))
      c3 = convert(LatLon{WGS84{2139}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{2139}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(34.99999995228484), T(45.0000000107594)))
      c3 = convert(LatLon{WGS84{2139}}, c2)
      @test isapprox(c3, c1)

      # ITRF2008 to ITRF2020
      c1 = LatLon{ITRF{2008}}(T(30), T(40))
      c2 = convert(LatLon{ITRF{2020}}, c1)
      @test isapprox(c2, LatLon{ITRF{2020}}(T(29.999999988422587), T(39.99999998545356)))
      c3 = convert(LatLon{ITRF{2008}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{ITRF{2008}}(T(35), T(45))
      c2 = convert(LatLon{ITRF{2020}}, c1)
      @test isapprox(c2, LatLon{ITRF{2020}}(T(34.99999999095351), T(44.99999998605742)))
      c3 = convert(LatLon{ITRF{2008}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G873) to WGS84 (G1150)
      c1 = LatLon{WGS84{873}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1150}}, c1)
      @test isapprox(c2, LatLon{WGS84{1150}}(T(30.00000010786122), T(39.999999917247415)))
      c3 = convert(LatLon{WGS84{873}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{873}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1150}}, c1)
      @test isapprox(c2, LatLon{WGS84{1150}}(T(35.00000011017596), T(44.99999991789371)))
      c3 = convert(LatLon{WGS84{873}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G1150) to WGS84 (G1674)
      c1 = LatLon{WGS84{1150}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{1674}}, c1)
      @test isapprox(c2, LatLon{WGS84{1674}}(T(30.00000023172869), T(40.00000012945685)))
      c3 = convert(LatLon{WGS84{1150}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{1150}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{1674}}, c1)
      @test isapprox(c2, LatLon{WGS84{1674}}(T(35.000000224015764), T(45.00000013653905)))
      c3 = convert(LatLon{WGS84{1150}}, c2)
      @test isapprox(c3, c1)

      # ITRF2008 to WGS84 (G2296)
      c1 = LatLon{ITRF{2008}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(30.000000002491856), T(39.99999990823712)))
      c3 = convert(LatLon{ITRF{2008}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{ITRF{2008}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(34.99999999819903), T(44.99999989931995)))
      c3 = convert(LatLon{ITRF{2008}}, c2)
      @test isapprox(c3, c1)

      # ITRF2014 to WGS84 (G2296)
      c1 = LatLon{ITRF{2014}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(29.999999954347434), T(40.00000001716363)))
      c3 = convert(LatLon{ITRF{2014}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{ITRF{2014}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(34.99999995139799), T(45.0000000107594)))
      c3 = convert(LatLon{ITRF{2014}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G0) to WGS84 (G2296)
      c1 = LatLon{WGS84{0}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(29.999997712065273), T(40.00000469221133)))
      c3 = convert(LatLon{WGS84{0}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{0}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(34.9999969048076), T(45.000004932853365)))
      c3 = convert(LatLon{WGS84{0}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G730) to WGS84 (G2296)
      c1 = LatLon{WGS84{730}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(30.000000499387685), T(39.999999911361925)))
      c3 = convert(LatLon{WGS84{730}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{730}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(35.000000496512904), T(44.9999999334018)))
      c3 = convert(LatLon{WGS84{730}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G873) to WGS84 (G2296)
      c1 = LatLon{WGS84{873}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(30.000000274405107), T(39.99999990515338)))
      c3 = convert(LatLon{WGS84{873}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{873}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(35.00000026140633), T(44.9999999024183)))
      c3 = convert(LatLon{WGS84{873}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G1150) to WGS84 (G2296)
      c1 = LatLon{WGS84{1150}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(30.000000166543877), T(39.999999987905944)))
      c3 = convert(LatLon{WGS84{1150}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{1150}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(35.00000015123037), T(44.999999984524585)))
      c3 = convert(LatLon{WGS84{1150}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G1674) to WGS84 (G2296)
      c1 = LatLon{WGS84{1674}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(29.999999934815197), T(39.999999858449094)))
      c3 = convert(LatLon{WGS84{1674}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{1674}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(34.9999999272146), T(44.99999984798553)))
      c3 = convert(LatLon{WGS84{1674}}, c2)
      @test isapprox(c3, c1)

      # WGS84 (G1762) to WGS84 (G2296)
      c1 = LatLon{WGS84{1762}}(T(30), T(40))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(30.000000003309403), T(39.99999990823712)))
      c3 = convert(LatLon{WGS84{1762}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{1762}}(T(35), T(45))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(34.99999999908588), T(44.99999989931995)))
      c3 = convert(LatLon{WGS84{1762}}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{WGS84{1762}}(T(30), T(40))
      c2 = LatLon{ITRF{2008}}(T(30), T(40))
      c3 = LatLon{ITRF{2020}}(T(29.999999988422587), T(39.99999998545356))
      c4 = LatLon{WGS84{0}}(T(30), T(40))
      c5 = LatLon{WGS84{2296}}(T(29.999997712065273), T(40.00000469221133))
      @inferred convert(LatLon{ITRF{2008}}, c1)
      @inferred convert(LatLon{WGS84{1762}}, c2)
      @inferred convert(LatLon{ITRF{2020}}, c2)
      @inferred convert(LatLon{ITRF{2008}}, c3)
      @inferred convert(LatLon{WGS84{2296}}, c4)
      @inferred convert(LatLon{WGS84{0}}, c5)
    end

    @testset "GeocentricLatLon: Datum conversion" begin
      # WGS84 (G1762) to ITRF2008
      c1 = GeocentricLatLon{WGS84{1762}}(T(30), T(40))
      c2 = convert(GeocentricLatLon{ITRF{2008}}, c1)
      @test isapprox(c2, GeocentricLatLon{ITRF{2008}}(T(30), T(40)))
      c3 = convert(GeocentricLatLon{WGS84{1762}}, c2)
      @test isapprox(c3, c1)

      c1 = GeocentricLatLon{WGS84{1762}}(T(35), T(45))
      c2 = convert(GeocentricLatLon{ITRF{2008}}, c1)
      @test isapprox(c2, GeocentricLatLon{ITRF{2008}}(T(35), T(45)))
      c3 = convert(GeocentricLatLon{WGS84{1762}}, c2)
      @test isapprox(c3, c1)

      # ITRF2008 to ITRF2020
      c1 = GeocentricLatLon{ITRF{2008}}(T(30), T(40))
      c2 = convert(GeocentricLatLon{ITRF{2020}}, c1)
      @test isapprox(c2, GeocentricLatLon{ITRF{2020}}(T(29.999999988624147), T(39.99999998542911)))
      c3 = convert(GeocentricLatLon{ITRF{2008}}, c2)
      @test isapprox(c3, c1)

      c1 = GeocentricLatLon{ITRF{2008}}(T(35), T(45))
      c2 = convert(GeocentricLatLon{ITRF{2020}}, c1)
      @test isapprox(c2, GeocentricLatLon{ITRF{2020}}(T(34.999999991156464), T(44.99999998602658)))
      c3 = convert(GeocentricLatLon{ITRF{2008}}, c2)
      @test isapprox(c3, c1)

      c1 = GeocentricLatLon{WGS84{1762}}(T(30), T(40))
      c2 = GeocentricLatLon{ITRF{2008}}(T(30), T(40))
      @inferred convert(GeocentricLatLon{ITRF{2008}}, c1)
      @inferred convert(GeocentricLatLon{ITRF{2020}}, c2)
    end
  end

  @testset "Projected" begin
    @testset "LatLon <> Mercator" begin
      # tested against Proj.Transformation("EPSG:4326", "EPSG:3395")
      c1 = LatLon(T(45), T(90))
      c2 = convert(Mercator, c1)
      @test isapprox(c2, Mercator(T(10018754.171394622), T(5591295.9185533915)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(Mercator, c1)
      @test isapprox(c2, Mercator(T(10018754.171394622), -T(5591295.9185533915)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(Mercator, c1)
      @test isapprox(c2, Mercator(-T(10018754.171394622), T(5591295.9185533915)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(Mercator, c1)
      @test isapprox(c2, Mercator(-T(10018754.171394622), -T(5591295.9185533915)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = Mercator(T(10018754.171394622), T(5591295.9185533915))
      @inferred convert(Mercator, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> WebMercator" begin
      # tested against Proj.Transformation("EPSG:4326", "EPSG:3857")
      c1 = LatLon(T(45), T(90))
      c2 = convert(WebMercator, c1)
      @test isapprox(c2, WebMercator(T(10018754.171394622), T(5621521.486192066)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(WebMercator, c1)
      @test isapprox(c2, WebMercator(T(10018754.171394622), -T(5621521.486192066)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(WebMercator, c1)
      @test isapprox(c2, WebMercator(-T(10018754.171394622), T(5621521.486192066)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(WebMercator, c1)
      @test isapprox(c2, WebMercator(-T(10018754.171394622), -T(5621521.486192066)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = WebMercator(T(10018754.171394622), T(5621521.486192066))
      @inferred convert(WebMercator, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> PlateCarree" begin
      # tested against Proj.Transformation("EPSG:4326", "EPSG:32662")
      c1 = LatLon(T(45), T(90))
      c2 = convert(PlateCarree, c1)
      @test isapprox(c2, PlateCarree(T(10018754.171394622), T(5009377.085697311)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(PlateCarree, c1)
      @test isapprox(c2, PlateCarree(T(10018754.171394622), -T(5009377.085697311)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(PlateCarree, c1)
      @test isapprox(c2, PlateCarree(-T(10018754.171394622), T(5009377.085697311)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(PlateCarree, c1)
      @test isapprox(c2, PlateCarree(-T(10018754.171394622), -T(5009377.085697311)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = PlateCarree(T(10018754.171394622), T(5009377.085697311))
      @inferred convert(PlateCarree, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> LambertCylindrical" begin
      # tested against Proj.Transformation("EPSG:4326", "ESRI:54034")
      c1 = LatLon(T(45), T(90))
      c2 = convert(LambertCylindrical, c1)
      @test isapprox(c2, LambertCylindrical(T(10018754.171394622), T(4489858.8869480025)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(LambertCylindrical, c1)
      @test isapprox(c2, LambertCylindrical(T(10018754.171394622), -T(4489858.8869480025)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(LambertCylindrical, c1)
      @test isapprox(c2, LambertCylindrical(-T(10018754.171394622), T(4489858.8869480025)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(LambertCylindrical, c1)
      @test isapprox(c2, LambertCylindrical(-T(10018754.171394622), -T(4489858.8869480025)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = LambertCylindrical(T(10018754.171394622), T(4489858.8869480025))
      @inferred convert(LambertCylindrical, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> Behrmann" begin
      # tested against Proj.Transformation("EPSG:4326", "ESRI:54017")
      c1 = LatLon(T(45), T(90))
      c2 = convert(Behrmann, c1)
      @test isapprox(c2, Behrmann(T(8683765.222580686), T(5180102.328839251)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(Behrmann, c1)
      @test isapprox(c2, Behrmann(T(8683765.222580686), -T(5180102.328839251)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(Behrmann, c1)
      @test isapprox(c2, Behrmann(-T(8683765.222580686), T(5180102.328839251)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(Behrmann, c1)
      @test isapprox(c2, Behrmann(-T(8683765.222580686), -T(5180102.328839251)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = Behrmann(T(8683765.222580686), T(5180102.328839251))
      @inferred convert(Behrmann, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> GallPeters" begin
      # forward tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=axisswap order=2,1
      # step proj=unitconvert xy_in=deg xy_out=rad
      # step proj=cea lat_ts=45 ellps=WGS84
      # """)
      # inverse tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=cea inv lat_ts=45 ellps=WGS84
      # step proj=unitconvert xy_in=rad xy_out=deg
      # step proj=axisswap order=2,1
      # """)
      c1 = LatLon(T(45), T(90))
      c2 = convert(GallPeters, c1)
      @test isapprox(c2, GallPeters(T(7096215.158458031), T(6338983.732612475)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(GallPeters, c1)
      @test isapprox(c2, GallPeters(T(7096215.158458031), -T(6338983.732612475)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(GallPeters, c1)
      @test isapprox(c2, GallPeters(-T(7096215.158458031), T(6338983.732612475)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(GallPeters, c1)
      @test isapprox(c2, GallPeters(-T(7096215.158458031), -T(6338983.732612475)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = GallPeters(T(7096215.158458031), T(6338983.732612475))
      @inferred convert(GallPeters, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> WinkelTripel" begin
      # tested against Proj.Transformation("EPSG:4326", "ESRI:54042")
      c1 = LatLon(T(45), T(90))
      c2 = convert(WinkelTripel, c1)
      @test isapprox(c2, WinkelTripel(T(7044801.6979576545), T(5231448.051548355)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(WinkelTripel, c1)
      @test isapprox(c2, WinkelTripel(T(7044801.6979576545), -T(5231448.051548355)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(WinkelTripel, c1)
      @test isapprox(c2, WinkelTripel(-T(7044801.6979576545), T(5231448.051548355)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(WinkelTripel, c1)
      @test isapprox(c2, WinkelTripel(-T(7044801.6979576545), -T(5231448.051548355)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(0), T(0))
      c2 = convert(WinkelTripel, c1)
      @test isapprox(c2, WinkelTripel(T(0), T(0)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = WinkelTripel(T(7044801.6979576545), T(5231448.051548355))
      @inferred convert(WinkelTripel, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> Robinson" begin
      # tested against Proj.Transformation("EPSG:4326", "ESRI:54030")
      c1 = LatLon(T(45), T(90))
      c2 = convert(Robinson, c1)
      @test isapprox(c2, Robinson(T(7620313.925950073), T(4805073.646653474)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(Robinson, c1)
      @test isapprox(c2, Robinson(T(7620313.925950073), -T(4805073.646653474)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(Robinson, c1)
      @test isapprox(c2, Robinson(-T(7620313.925950073), T(4805073.646653474)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(Robinson, c1)
      @test isapprox(c2, Robinson(-T(7620313.925950073), -T(4805073.646653474)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = Robinson(T(7620313.925950073), T(4805073.646653474))
      @inferred convert(Robinson, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> Orthographic (Elliptical)" begin
      # forward tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=axisswap order=2,1
      # step proj=unitconvert xy_in=deg xy_out=rad
      # step proj=ortho lat_0=90 ellps=WGS84
      # """)
      # inverse tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=ortho inv lat_0=90 ellps=WGS84
      # step proj=unitconvert xy_in=rad xy_out=deg
      # step proj=axisswap order=2,1
      # """)
      c1 = LatLon(T(30), T(60))
      c2 = convert(OrthoNorth, c1)
      @test isapprox(c2, OrthoNorth(T(4787610.688267582), T(-2764128.319646418)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(30), -T(60))
      c2 = convert(OrthoNorth, c1)
      @test isapprox(c2, OrthoNorth(-T(4787610.688267582), T(-2764128.319646418)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # forward tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=axisswap order=2,1
      # step proj=unitconvert xy_in=deg xy_out=rad
      # step proj=ortho lat_0=-90 ellps=WGS84
      # """)
      # inverse tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=ortho inv lat_0=-90 ellps=WGS84
      # step proj=unitconvert xy_in=rad xy_out=deg
      # step proj=axisswap order=2,1
      # """)
      c1 = LatLon(-T(30), T(60))
      c2 = convert(OrthoSouth, c1)
      @test isapprox(c2, OrthoSouth(T(4787610.688267582), T(2764128.319646418)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(30), -T(60))
      c2 = convert(OrthoSouth, c1)
      @test isapprox(c2, OrthoSouth(-T(4787610.688267582), T(2764128.319646418)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # invert central coordinates
      ShiftedOrthoElliptical =
        CoordRefSystems.shift(CoordRefSystems.Orthographic{CoordRefSystems.EllipticalMode,30.0°,WGS84Latest}, lonₒ=60°)
      c1 = LatLon(T(30), T(60))
      c2 = convert(ShiftedOrthoElliptical, c1)
      @test isapprox(c2, ShiftedOrthoElliptical(T(0), T(0)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(30), T(60))
      c3 = OrthoNorth(T(4787610.688267582), T(-2764128.319646418))
      c2 = LatLon(-T(30), T(60))
      c4 = OrthoSouth(T(4787610.688267582), T(2764128.319646418))
      @inferred convert(OrthoNorth, c1)
      @inferred convert(OrthoSouth, c2)
      @inferred convert(LatLon, c3)
      @inferred convert(LatLon, c4)
    end

    @testset "LatLon <> Orthographic (Spherical)" begin
      OrthoNorthSpherical = CoordRefSystems.get(ESRI{102035})
      OrthoSouthSpherical = CoordRefSystems.get(ESRI{102037})

      # tested against Proj.Transformation("EPSG:4326", "ESRI:102035")
      c1 = LatLon(T(30), T(60))
      c2 = convert(OrthoNorthSpherical, c1)
      @test isapprox(c2, OrthoNorthSpherical(T(4783602.75), T(-2761814.335408735)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(30), -T(60))
      c2 = convert(OrthoNorthSpherical, c1)
      @test isapprox(c2, OrthoNorthSpherical(-T(4783602.75), T(-2761814.335408735)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # tested against Proj.Transformation("EPSG:4326", "ESRI:102037")
      c1 = LatLon(-T(30), T(60))
      c2 = convert(OrthoSouthSpherical, c1)
      @test isapprox(c2, OrthoSouthSpherical(T(4783602.75), T(2761814.335408735)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(30), -T(60))
      c2 = convert(OrthoSouthSpherical, c1)
      @test isapprox(c2, OrthoSouthSpherical(-T(4783602.75), T(2761814.335408735)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # invert central coordinates
      ShiftedOrthoSpherical =
        CoordRefSystems.shift(CoordRefSystems.Orthographic{CoordRefSystems.SphericalMode,30.0°,WGS84Latest}, lonₒ=60°)
      c1 = LatLon(T(30), T(60))
      c2 = convert(ShiftedOrthoSpherical, c1)
      @test isapprox(c2, ShiftedOrthoSpherical(T(0), T(0)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(30), T(60))
      c2 = LatLon(-T(30), T(60))
      c3 = OrthoNorthSpherical(T(4783602.75), T(-2761814.335408735))
      c4 = OrthoSouthSpherical(T(4783602.75), T(2761814.335408735))
      @inferred convert(OrthoNorthSpherical, c1)
      @inferred convert(OrthoSouthSpherical, c2)
      @inferred convert(LatLon, c3)
      @inferred convert(LatLon, c4)
    end

    @testset "LatLon <> TransverseMercator" begin
      # tests from GeographicLib testset
      # link: https://sourceforge.net/projects/geographiclib/files/testdata/TMcoords.dat.gz
      TM = TransverseMercator{0.9996,0.0°,WGS84Latest}

      c1 = LatLon(T(70.579277094557), T(45.599419731762))
      c2 = convert(TM, c1)
      @test isapprox(c2, TM(T(1548706.7916191491794), T(8451449.1987722350778)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(19.479895588178), T(75.662049225092))
      c2 = convert(TM, c1)
      @test isapprox(c2, TM(T(9855841.2329353332058), T(6145496.1151551160577)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(5.458957393183), T(36.385237374895))
      c2 = convert(TM, c1)
      @test isapprox(c2, TM(T(4328154.0835012728645), T(749647.6236903529367)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(61.965604972549), T(58.931370849824))
      c2 = convert(TM, c1)
      @test isapprox(c2, TM(T(2727657.3379737519243), T(8283916.696409868168)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # latₒ, lonₒ ≠ 0
      TM = CoordRefSystems.shift(TransverseMercator{0.9996,15.0°,WGS84Latest}, lonₒ=25.0°)

      # forward tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=axisswap order=2,1
      # step proj=unitconvert xy_in=deg xy_out=rad
      # step proj=tmerc lat_0=15 lon_0=25 k_0=0.9996 ellps=WGS84
      # """)
      # inverse tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=tmerc inv lat_0=15 lon_0=25 k_0=0.9996 ellps=WGS84
      # step proj=unitconvert xy_in=rad xy_out=deg
      # step proj=axisswap order=2,1
      # """)
      c1 = LatLon(T(30), T(60))
      c2 = convert(TM, c1)
      @test isapprox(c2, TM(T(3478021.0568801453), T(2237622.8976712096)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(35), T(65))
      c2 = convert(TM, c1)
      @test isapprox(c2, TM(T(3736618.554412091), T(3043187.5889959945)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(30), T(60))
      c2 = TM(T(3478021.0568801453), T(2237622.8976712096))
      @inferred convert(TM, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> Albers" begin
      # tested against Proj.Transformation("EPSG:4269", "EPSG:5070")
      AlbersUS = CoordRefSystems.shift(Albers{23.0°,29.5°,45.5°,NAD83}, lonₒ=-96°)
      c1 = LatLon{NAD83}(T(45), T(90))
      c2 = convert(AlbersUS, c1)
      @test isapprox(c2, AlbersUS(-T(7.231430540202629e6), T(1.1853758709623523e7)))
      c3 = convert(LatLon{NAD83}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{NAD83}(-T(45), T(90))
      c2 = convert(AlbersUS, c1)
      @test isapprox(c2, AlbersUS(-T(1.5156419949174397e7), T(1.3963188032694416e7)))
      c3 = convert(LatLon{NAD83}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{NAD83}(T(45), -T(90))
      c2 = convert(AlbersUS, c1)
      @test isapprox(c2, AlbersUS(T(472145.2567221438), T(2.4606302944375253e6)))
      c3 = convert(LatLon{NAD83}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{NAD83}(-T(45), -T(90))
      c2 = convert(AlbersUS, c1)
      @test isapprox(c2, AlbersUS(T(989573.4665648951), -T(5.723953827495912e6)))
      c3 = convert(LatLon{NAD83}, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon{NAD83}(T(45), T(90))
      c2 = AlbersUS(-T(7.231430540202629e6), T(1.1853758709623523e7))
      @inferred convert(AlbersUS, c1)
      @inferred convert(LatLon{NAD83}, c2)
    end

    @testset "LatLon <> LambertConic" begin
      # this specific example was chosen to fit the one in "Geomatics Guidance Note number 7, part 2 – September 2019, p.19"
      # tested against Proj.Transformation("proj=pipeline step proj=axisswap order=2,1 step proj=unitconvert 
      #   xy_in=deg xy_out=rad step proj=lcc lat_0=27.8333333333333 lon_0=-99 lat_1=28.3833333333333 lat_2=30.2833333333333 
      #   x_0=609601.219202438 y_0=0 ellps=clrk66 step proj=unitconvert xy_in=m xy_out=m")
      LambertTexasSouthCentral = CoordRefSystems.shift(
        LambertConic{27.8333333333333°,28.3833333333333°,30.2833333333333°,NAD27},
        lonₒ=-99°,
        xₒ=609601.219202438m
      )

      c1 = LatLon{NAD27}(T(28.5), -T(96))
      c2 = convert(LambertTexasSouthCentral, c1)
      @test isapprox(c2, LambertTexasSouthCentral(T(903277.7991828895), T(77650.94253892983)))
      c3 = convert(LatLon{NAD27}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{NAD27}(-T(28.5), -T(96))
      c2 = convert(LambertTexasSouthCentral, c1)
      @test isapprox(c2, LambertTexasSouthCentral(T(1.0965384045392217e6), T(-7.454704497666729e6)))
      c3 = convert(LatLon{NAD27}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{NAD27}(T(28.5), T(96))
      c2 = convert(LambertTexasSouthCentral, c1)
      @test isapprox(c2, LambertTexasSouthCentral(T(-1.0694092770898357e7), T(9.700135873608802e6)))
      c3 = convert(LatLon{NAD27}, c2)
      @test isapprox(c3, c1)

      c1 = LatLon{NAD27}(-T(28.5), T(96))
      c2 = convert(LambertTexasSouthCentral, c1)
      @test isapprox(c2, LambertTexasSouthCentral(T(-1.8132747713812184e7), T(8.500077216941461e6)))
      c3 = convert(LatLon{NAD27}, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon{NAD27}(T(28.5), -T(96))
      c2 = LambertTexasSouthCentral(T(903277.7991828895), T(77650.94253892983))
      @inferred convert(LambertTexasSouthCentral, c1)
      @inferred convert(LatLon{NAD27}, c2)
    end

    @testset "LatLon <> Sinusoidal" begin
      c1 = LatLon(T(45), T(90))
      c2 = convert(Sinusoidal, c1)
      @test isapprox(c2, Sinusoidal(T(7.084329013634147e6), T(5.009377085697311e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(Sinusoidal, c1)
      @test isapprox(c2, Sinusoidal(T(7.084329013634147e6), -T(5.009377085697311e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(Sinusoidal, c1)
      @test isapprox(c2, Sinusoidal(-T(7.084329013634147e6), T(5.009377085697311e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(Sinusoidal, c1)
      @test isapprox(c2, Sinusoidal(-T(7.084329013634147e6), -T(5.009377085697311e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = Sinusoidal(T(7.084329013634147e6), T(5.009377085697311e6))
      @inferred convert(Sinusoidal, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> LambertAzimuthal" begin
      # forward tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=axisswap order=2,1
      # step proj=unitconvert xy_in=deg xy_out=rad
      # step proj=laea lat_0=15 ellps=WGS84
      # """)
      # inverse tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=laea inv lat_0=15 ellps=WGS84
      # step proj=unitconvert xy_in=rad xy_out=deg
      # step proj=axisswap order=2,1
      # """)
      LAEA = LambertAzimuthal{15.0°}
      c1 = LatLon(T(45), T(90))
      c2 = convert(LAEA, c1)
      @test isapprox(c2, LAEA(T(5.879661317585923e6), T(5.643833348229035e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(LAEA, c1)
      @test isapprox(c2, LAEA(T(7.066637230781689e6), -T(6.783200716618443e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(LAEA, c1)
      @test isapprox(c2, LAEA(-T(5.879661317585923e6), T(5.643833348229035e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(LAEA, c1)
      @test isapprox(c2, LAEA(-T(7.066637230781689e6), -T(6.783200716618443e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # invert central coordinates
      ShiftedLAEA = CoordRefSystems.shift(LambertAzimuthal{30.0°,WGS84Latest}, lonₒ=60°)
      c1 = LatLon(T(30), T(60))
      c2 = convert(ShiftedLAEA, c1)
      @test isapprox(c2, ShiftedLAEA(T(0), T(0)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = LAEA(T(5.879661317585923e6), T(5.643833348229035e6))
      @inferred convert(LAEA, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> EqualEarth" begin
      # forward tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=axisswap order=2,1
      # step proj=unitconvert xy_in=deg xy_out=rad
      # step proj=eqearth ellps=WGS84
      # """)
      # inverse tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=eqearth inv ellps=WGS84
      # step proj=unitconvert xy_in=rad xy_out=deg
      # step proj=axisswap order=2,1
      # """)
      c1 = LatLon(T(45), T(90))
      c2 = convert(EqualEarth, c1)
      @test isapprox(c2, EqualEarth(T(7.396237374497802e6), T(5.466867760213717e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(EqualEarth, c1)
      @test isapprox(c2, EqualEarth(T(7.396237374497802e6), -T(5.466867760213717e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(EqualEarth, c1)
      @test isapprox(c2, EqualEarth(-T(7.396237374497802e6), T(5.466867760213717e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(EqualEarth, c1)
      @test isapprox(c2, EqualEarth(-T(7.396237374497802e6), -T(5.466867760213717e6)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = EqualEarth(T(7.396237374497802e6), T(5.466867760213717e6))
      @inferred convert(EqualEarth, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> UTM" begin
      UTMNorth32 = utmnorth(32)
      UTMSouth59 = utmsouth(59)

      # tested against Proj.Transformation("EPSG:4326", "EPSG:32632")
      c1 = LatLon(T(56), T(12))
      c2 = convert(UTMNorth32, c1)
      @test isapprox(c2, UTMNorth32(T(687071.439107327), T(6210141.326872105)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # tested against Proj.Transformation("EPSG:4326", "EPSG:32759")
      c1 = LatLon(-T(44), T(174))
      c2 = convert(UTMSouth59, c1)
      @test isapprox(c2, UTMSouth59(T(740526.3210524899), T(5123750.873037999)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(56), T(12))
      c2 = LatLon(-T(44), T(174))
      c3 = UTMNorth32(T(687071.439107327), T(6210141.326872105))
      c4 = UTMSouth59(T(740526.3210524899), T(5123750.873037999))
      @inferred convert(UTMNorth32, c1)
      @inferred convert(UTMSouth59, c2)
      @inferred convert(LatLon, c3)
      @inferred convert(LatLon, c4)
    end

    @testset "LatLon <> ShiftedCRS" begin
      # forward tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=axisswap order=2,1
      # step proj=unitconvert xy_in=deg xy_out=rad
      # step proj=merc lon_0=15 x_0=200 y_0=200 ellps=WGS84
      # """)
      # inverse tested against Proj.Transformation("""
      # proj=pipeline
      # step proj=merc inv lon_0=15 x_0=200 y_0=200 ellps=WGS84
      # step proj=unitconvert xy_in=rad xy_out=deg
      # step proj=axisswap order=2,1
      # """)
      ShiftedMercator = CoordRefSystems.shift(Mercator{WGS84Latest}, lonₒ=15.0°, xₒ=200.0m, yₒ=200.0m)
      c1 = LatLon(T(45), T(90))
      c2 = convert(ShiftedMercator, c1)
      @test isapprox(c2, ShiftedMercator(T(8349161.809495518), T(5591495.9185533915)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), T(90))
      c2 = convert(ShiftedMercator, c1)
      @test isapprox(c2, ShiftedMercator(T(8349161.809495518), -T(5591095.9185533915)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(T(45), -T(90))
      c2 = convert(ShiftedMercator, c1)
      @test isapprox(c2, ShiftedMercator(-T(11688346.533293724), T(5591495.9185533915)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      c1 = LatLon(-T(45), -T(90))
      c2 = convert(ShiftedMercator, c1)
      @test isapprox(c2, ShiftedMercator(-T(11688346.533293724), -T(5591095.9185533915)))
      c3 = convert(LatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLon(T(45), T(90))
      c2 = ShiftedMercator(T(8349161.809495518), T(5591495.9185533915))
      @inferred convert(ShiftedMercator, c1)
      @inferred convert(LatLon, c2)
    end

    @testset "LatLon <> Projected (different datums)" begin
      # WGS84 (G1762) to ITRF2008
      c1 = LatLon{WGS84{1762}}(T(45), T(90))
      c2 = convert(Mercator{ITRF{2008}}, c1)
      @test isapprox(c2, Mercator{ITRF{2008}}(T(10018754.171394622), T(5591295.9185533915)))

      c1 = Mercator{WGS84{1762}}(T(10018754.171394622), T(5591295.9185533915))
      c2 = convert(LatLon{ITRF{2008}}, c1)
      @test isapprox(c2, LatLon{ITRF{2008}}(T(45), T(90)))

      # ITRF2008 to ITRF2020
      ShiftedMercator = CoordRefSystems.shift(Mercator{ITRF{2020}}, lonₒ=15.0°, xₒ=200.0m, yₒ=200.0m)
      c1 = LatLon{ITRF{2008}}(T(45), T(90))
      c2 = convert(ShiftedMercator, c1)
      @test isapprox(c2, ShiftedMercator(T(8349161.8090374395), T(5591495.918071649)))

      ShiftedMercator = CoordRefSystems.shift(Mercator{ITRF{2008}}, lonₒ=15.0°, xₒ=200.0m, yₒ=200.0m)
      c1 = ShiftedMercator(T(8349161.8090374395), T(5591495.918071649))
      c2 = convert(LatLon{ITRF{2020}}, c1)
      @test isapprox(c2, LatLon{ITRF{2020}}(T(44.99999999574679), T(89.99999999177004)))

      # GGRS87 to WGS84
      c1 = LatLon{GGRS87}(T(45), T(90))
      c2 = convert(PlateCarree{WGS84{1762}}, c1)
      @test isapprox(c2, PlateCarree{WGS84{1762}}(T(10019036.352134585), T(5009498.78549335)))

      c1 = PlateCarree{GGRS87}(T(10019036.352134585), T(5009498.78549335))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(45.002186400242984), T(90.00506975166428)))

      # NAD83 to WGS84
      c1 = LatLon{NAD83}(T(45), T(90))
      c2 = convert(WinkelTripel{WGS84{1762}}, c1)
      @test isapprox(c2, WinkelTripel{WGS84{1762}}(T(7044801.698007298), T(5231448.051441181)))

      c1 = WinkelTripel{NAD83}(T(7044801.698007298), T(5231448.051441181))
      c2 = convert(LatLon{WGS84{1762}}, c1)
      @test isapprox(c2, LatLon{WGS84{1762}}(T(45), T(90)))

      # WGS84 (G2296) to ETRF2020
      c1 = LatLon{WGS84{2296}}(T(45), T(90))
      c2 = convert(LambertAzimuthal{52.0°,ETRF{2020}}, c1)
      @test isapprox(c2, LambertAzimuthal{52.0°,ETRF{2020}}(T(5122666.32147123), T(3145786.6707593063)))

      c1 = LambertAzimuthal{52.0°,ETRF{2020}}(T(5122666.32147123), T(3145786.6707593063))
      c2 = convert(LatLon{WGS84{2296}}, c1)
      @test isapprox(c2, LatLon{WGS84{2296}}(T(45), T(90)))

      # type stability
      c1 = LatLon{WGS84{1762}}(T(45), T(90))
      c2 = Mercator{WGS84{1762}}(T(10018754.171394622), T(5591295.9185533915))
      @inferred convert(Mercator{ITRF{2008}}, c1)
      @inferred convert(LatLon{ITRF{2008}}, c2)
    end

    @testset "LatLonAlt <> Projected" begin
      c1 = LatLonAlt(T(45), T(90), T(0))
      c2 = convert(Mercator, c1)
      @test isapprox(c2, Mercator(T(10018754.171394622), T(5591295.9185533915)))
      c3 = convert(LatLonAlt, c2)
      @test isapprox(c3, c1)

      c1 = LatLonAlt(T(45), T(90), T(0))
      c2 = convert(WinkelTripel, c1)
      @test isapprox(c2, WinkelTripel(T(7044801.6979576545), T(5231448.051548355)))
      c3 = convert(LatLonAlt, c2)
      @test isapprox(c3, c1)

      ShiftedMercator = CoordRefSystems.shift(Mercator{WGS84Latest}, lonₒ=15.0°, xₒ=200.0m, yₒ=200.0m)
      c1 = LatLonAlt(T(45), T(90), T(0))
      c2 = convert(ShiftedMercator, c1)
      @test isapprox(c2, ShiftedMercator(T(8349161.809495518), T(5591495.9185533915)))
      c3 = convert(LatLonAlt, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = LatLonAlt(T(45), T(90), T(0))
      c2 = Mercator(T(10018754.171394622), T(5591295.9185533915))
      c3 = WinkelTripel(T(7044801.6979576545), T(5231448.051548355))
      c4 = ShiftedMercator(T(8349161.809495518), T(5591495.9185533915))
      @inferred convert(Mercator, c1)
      @inferred convert(LatLonAlt, c2)
      @inferred convert(LatLonAlt, c3)
      @inferred convert(LatLonAlt, c4)
    end

    @testset "GeocentricLatLon <> Projected" begin
      c1 = GeocentricLatLon(T(45), T(90))
      c2 = convert(Mercator, c1)
      @test isapprox(c2, Mercator(T(10018754.171394622), T(5621538.488121794)))
      c3 = convert(GeocentricLatLon, c2)
      @test isapprox(c3, c1)

      c1 = GeocentricLatLon(T(45), T(90))
      c2 = convert(WinkelTripel, c1)
      @test isapprox(c2, WinkelTripel(T(7034650.123120441), T(5253308.640402036)))
      c3 = convert(GeocentricLatLon, c2)
      @test isapprox(c3, c1)

      ShiftedMercator = CoordRefSystems.shift(Mercator{WGS84Latest}, lonₒ=15.0°, xₒ=200.0m, yₒ=200.0m)
      c1 = GeocentricLatLon(T(45), T(90))
      c2 = convert(ShiftedMercator, c1)
      @test isapprox(c2, ShiftedMercator(T(8349161.809495518), T(5621738.488121794)))
      c3 = convert(GeocentricLatLon, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = GeocentricLatLon(T(45), T(90))
      c2 = Mercator(T(10018754.171394622), T(5621538.488121794))
      c3 = WinkelTripel(T(7034650.123120441), T(5253308.640402036))
      c4 = ShiftedMercator(T(8349161.809495518), T(5621738.488121794))
      @inferred convert(Mercator, c1)
      @inferred convert(GeocentricLatLon, c2)
      @inferred convert(GeocentricLatLon, c3)
      @inferred convert(GeocentricLatLon, c4)
    end

    @testset "GeocentricLatLonAlt <> Projected" begin
      c1 = GeocentricLatLonAlt(T(45), T(90), T(0))
      c2 = convert(Mercator, c1)
      @test isapprox(c2, Mercator(T(10018754.171394622), T(5621538.488121794)))
      c3 = convert(GeocentricLatLonAlt, c2)
      @test isapprox(c3, c1)

      c1 = GeocentricLatLonAlt(T(45), T(90), T(0))
      c2 = convert(WinkelTripel, c1)
      @test isapprox(c2, WinkelTripel(T(7034650.123120441), T(5253308.640402036)))
      c3 = convert(GeocentricLatLonAlt, c2)
      @test isapprox(c3, c1)

      ShiftedMercator = CoordRefSystems.shift(Mercator{WGS84Latest}, lonₒ=15.0°, xₒ=200.0m, yₒ=200.0m)
      c1 = GeocentricLatLonAlt(T(45), T(90), T(0))
      c2 = convert(ShiftedMercator, c1)
      @test isapprox(c2, ShiftedMercator(T(8349161.809495518), T(5621738.488121794)))
      c3 = convert(GeocentricLatLonAlt, c2)
      @test isapprox(c3, c1)

      # type stability
      c1 = GeocentricLatLonAlt(T(45), T(90), T(0))
      c2 = Mercator(T(10018754.171394622), T(5621538.488121794))
      c3 = WinkelTripel(T(7034650.123120441), T(5253308.640402036))
      c4 = ShiftedMercator(T(8349161.809495518), T(5621738.488121794))
      @inferred convert(Mercator, c1)
      @inferred convert(GeocentricLatLonAlt, c2)
      @inferred convert(GeocentricLatLonAlt, c3)
      @inferred convert(GeocentricLatLonAlt, c4)
    end

    @testset "Cartesian <> Projected" begin
      ShiftedMercator = CoordRefSystems.shift(Mercator{WGS84Latest}, lonₒ=15.0°, xₒ=200.0m, yₒ=200.0m)

      # conversion to cartesian 2D
      c1 = Mercator(T(1), T(1))
      c2 = convert(Cartesian2D, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(1), T(1)))
      c3 = convert(Mercator{WGS84Latest}, c2)
      @test isapprox(c3, c1)

      c1 = OrthoNorth(T(1), T(1))
      c2 = convert(Cartesian2D, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(1), T(1)))
      c3 = convert(OrthoNorth{WGS84Latest}, c2)
      @test isapprox(c3, c1)

      c1 = ShiftedMercator(T(1), T(1))
      c2 = convert(Cartesian2D, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(1), T(1)))
      c3 = convert(ShiftedMercator, c2)
      @test isapprox(c3, c1)

      # converting using Cartesian is equivalent to converting using Cartesian2D
      c1 = Mercator(T(1), T(1))
      c2 = OrthoNorth(T(1), T(1))
      c3 = ShiftedMercator(T(1), T(1))
      @test convert(Cartesian, c1) == convert(Cartesian2D, c1)
      @test convert(Cartesian, c2) == convert(Cartesian2D, c2)
      @test convert(Cartesian, c3) == convert(Cartesian2D, c3)

      # conversion to cartesian 3D
      c1 = convert(Mercator, LatLon(T(30), T(40)))
      c2 = convert(Cartesian3D, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(4234890.278665873), T(3553494.8709047823), T(3170373.735383637)))
      c3 = convert(Mercator{WGS84Latest}, c2)
      @test isapprox(c3, c1)

      c1 = convert(OrthoNorth, LatLon(T(30), T(40)))
      c2 = convert(Cartesian3D, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(4234890.278665873), T(3553494.8709047823), T(3170373.735383637)))
      c3 = convert(OrthoNorth{WGS84Latest}, c2)
      @test isapprox(c3, c1)

      c1 = convert(ShiftedMercator, LatLon(T(30), T(40)))
      c2 = convert(Cartesian3D, c1)
      @test isapprox(c2, Cartesian{WGS84Latest}(T(4234890.278665873), T(3553494.8709047823), T(3170373.735383637)))
      c3 = convert(ShiftedMercator, c2)
      @test isapprox(c3, c1)

      # cartesian without datum
      c1 = Cartesian(T(1), T(2))
      c2 = convert(Mercator{WGS84Latest}, c1)
      @test isapprox(c2, Mercator(T(1), T(2)))

      c1 = Cartesian(T(1), T(2))
      c2 = convert(OrthoNorth{WGS84Latest}, c1)
      @test isapprox(c2, OrthoNorth(T(1), T(2)))

      c1 = Cartesian(T(1), T(2))
      c2 = convert(ShiftedMercator, c1)
      @test isapprox(c2, ShiftedMercator(T(1), T(2)))

      # type stability
      c1 = Cartesian{WGS84Latest}(T(1), T(1))
      c2 = Cartesian{WGS84Latest}(T(4234890.278665873), T(3553494.8709047823), T(3170373.735383637))
      c3 = Cartesian(T(1), T(2))
      c4 = Mercator(T(0), T(0))
      c5 = OrthoNorth(T(0), T(0))
      c6 = ShiftedMercator(T(0), T(0))
      @inferred convert(Mercator{WGS84Latest}, c1)
      @inferred convert(OrthoNorth{WGS84Latest}, c1)
      @inferred convert(ShiftedMercator, c1)
      @inferred convert(Mercator{WGS84Latest}, c2)
      @inferred convert(OrthoNorth{WGS84Latest}, c2)
      @inferred convert(ShiftedMercator, c2)
      @inferred convert(Mercator{WGS84Latest}, c3)
      @inferred convert(OrthoNorth{WGS84Latest}, c3)
      @inferred convert(ShiftedMercator, c3)
      @inferred convert(Cartesian2D, c4)
      @inferred convert(Cartesian2D, c5)
      @inferred convert(Cartesian2D, c6)
      @inferred convert(Cartesian3D, c4)
      @inferred convert(Cartesian3D, c5)
      @inferred convert(Cartesian3D, c6)
    end

    @testset "Projected <> Projected" begin
      ShiftedMercator = CoordRefSystems.shift(Mercator{WGS84Latest}, lonₒ=15.0°, xₒ=200.0m, yₒ=200.0m)

      # same datum
      c1 = LambertCylindrical(T(10018754.171394622), T(4489858.8869480025))
      c2 = convert(WinkelTripel, c1)
      @test isapprox(c2, WinkelTripel(T(7044801.69820402), T(5231448.051016482)))

      c1 = WinkelTripel(T(7044801.6979576545), T(5231448.051548355))
      c2 = convert(Robinson, c1)
      @test isapprox(c2, Robinson(T(7620313.9259500755), T(4805073.646653474)))

      c1 = PlateCarree(T(10018754.171394622), T(5009377.085697311))
      c2 = convert(ShiftedMercator, c1)
      @test isapprox(c2, ShiftedMercator(T(8349161.809495518), T(5591495.9185533915)))

      # different datums
      c1 = LambertCylindrical{ITRF{2008}}(T(10018754.171394622), T(4489858.886849141))
      c2 = convert(WinkelTripel{ITRF{2020}}, c1)
      @test isapprox(c2, WinkelTripel{ITRF{2020}}(T(7044801.699171027), T(5231448.049360464)))

      c1 = WinkelTripel{ITRF{2008}}(T(7044801.697957653), T(5231448.051548355))
      c2 = convert(Robinson{ITRF{2020}}, c1)
      @test isapprox(c2, Robinson{ITRF{2020}}(T(7620313.811209339), T(4805075.1317550065)))

      c1 = LambertCylindrical(T(10018754.171394622), T(4489858.8869480025))
      c2 = LambertCylindrical{ITRF{2008}}(T(10018754.171394622), T(4489858.886849141))
      @inferred convert(WinkelTripel, c1)
      @inferred convert(WinkelTripel{ITRF{2020}}, c2)
    end
  end
end
