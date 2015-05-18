requires 'Math::Round';
requires 'Math::Trig';
requires 'POSIX';

on configure => sub {
    requires 'ExtUtils::MakeMaker';
};

on test => sub {
    requires 'Test::More', '0.96';
};
