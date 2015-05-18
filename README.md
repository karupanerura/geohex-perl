[![Build Status](https://travis-ci.org/karupanerura/geohex-perl.svg?branch=master)](https://travis-ci.org/karupanerura/geohex-perl) [![Coverage Status](https://img.shields.io/coveralls/karupanerura/geohex-perl/master.svg?style=flat)](https://coveralls.io/r/karupanerura/geohex-perl?branch=master)
# NAME

Geo::Hex - GeoHex decoder/encoder

# SYNOPSIS

    use Geo::Hex;
    
    # OO-style
    my $geohex = Geo::Hex->new( version => 3 ); # v3 by default
    
    $geohex->spec_version; # => 3
    
    my ($lat, $lon, $level) = $geohex->decode( 'XM4885487' );
    my $code                = $geohex->encode( $lat, $lon, $level );
    # => XM4885487
    
    my $zone = $geohex->to_zone( 'XM4885487' );
       $zone = $geohex->to_zone( $lat, $lon, $level );
    
    # * zone object: hash value
    # $zone->code  : GeoHex code
    # $zone->level : Level
    # $zone->lat   : Latirude of given GeoHex's center point
    # $zone->lon   : Longitude of given GeoHex's center point
    # $zone->x     : Mercator X coordinate of given GeoHex's center point 
    # $zone->y     : Mercator Y coordinate of given GeoHex's center point 
    
    my $polygon = $zone->hex_coords; # return the hex coords (six points hold lat and lon)
    
    
    # Export function - GeoHex v3 by default
    ($lat, $lon, $level) = decode_geohex( $code );
    $code = encode_geohex( $lat, $lon, $level );
    
    # Explicit export function
    use Geo::Hex v => 3, qw(latlng2geohex geohex2latlng latlng2zone geohex2zone);
    
    # From latitude/longitude to hex code
    $code = latlng2geohex( $lat, $lng, $level );
        # From hex code to center latitude/longitude
    my ( $center_lat, $center_lng, $level ) = geohex2latlng( $code );

# VERSION

This is a beta version, so interfaces may be changed in future.

# CLASS METHODS

## new

    $geohex = Geo::Hex->new( %option );

Creates a new Geo::Hex::Coder object. It can take options:

- version

    The GeoHex specification vresion.

- v

    The synonym to `version` option.

## spec\_version

Returns specification version.

# INSTANCE METHODS

## decode

    ( $lat, $lon, $level ) = $geohex->decode( $code );

## encode

    $code = $geohex->encode( $lat, $lon, $level );

## to\_zone

    $zone = $geohex->to_zone( $code );
    
    $zone = $geohex->to_zone( $lat, $lon, $level );

## spec\_version

Returns specification version.

# EXPORT FUNCTIONS

## decode\_geohex

    ($lat, $lon, $level) = decode_geohex( $code );

Convert latitude/longitude to GeoHex code.

## encode\_geohex

    $code = encode_geohex( $lat, $lon, $level );

Convert GeoHex code to center latitude/longitude, and level value.

# FUNCTIONS

    use Geo::Hex v => 3;

## latlng2geohex

    $code = latlng2geohex( $lat, $lon, $level );

Same as `encode_geohex`.

## geohex2latlng

    ($lat, $lon, $level) = geohex2latlng( $code );

Same as `decode_geohex`.

## latlng2zone

    $zone = latlng2zone( $lat, $lon, $level );

Takes a location and its level, and returns [GeoHex::Zone](https://metacpan.org/pod/GeoHex::Zone).

## geohex2zone

    $zone = geohex2zone( $code );

Takes a geohex code and returns [GeoHex::Zone](https://metacpan.org/pod/GeoHex::Zone).

# SEE ALSO

[https://sites.google.com/site/geohexdocs/](https://sites.google.com/site/geohexdocs/),
[http://geogames.net/geohex/v3](http://geogames.net/geohex/v3)

[Geo::Hex::V1](https://metacpan.org/pod/Geo::Hex::V1),
[Geo::Hex::V2](https://metacpan.org/pod/Geo::Hex::V2),
[Geo::Hex::V3](https://metacpan.org/pod/Geo::Hex::V3),
[Geo::Hex::Zone](https://metacpan.org/pod/Geo::Hex::Zone)

# AUTHORS

Frontend module [Geo::Hex](https://metacpan.org/pod/Geo::Hex) by Makamaka Hannyaharamitu

[Geo::Hex::V1](https://metacpan.org/pod/Geo::Hex::V1) are originally written by OHTSUKA Ko-hei  `<nene@kokogiko.net>`

[Geo::Hex::V2](https://metacpan.org/pod/Geo::Hex::V2) are originally written by OHTSUKA Ko-hei and maintained by Makamaka Hannyaharamitu

[Geo::Hex::V2::XS](https://metacpan.org/pod/Geo::Hex::V2::XS) are originally written by lestrrat

[Geo::Hex::V3](https://metacpan.org/pod/Geo::Hex::V3) are originally written by soh335

# LICENCE AND COPYRIGHT

GeoHex by @sa2da (http://geogames.net) is licensed under
Creative Commons BY-SA 2.1 Japan License.

Geo::Hex - Copyright 2011 Makamaka Hannyaharamitu

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
