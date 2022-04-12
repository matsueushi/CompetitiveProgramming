function conv(m, b, ms1, ms2)
    d = 10^9 + 7
    pmod = powermod(10, m, b) # avoid overflow
    nextms = zeros(Int64, b)
    for j1 in 0:b-1
        for j2 in 0:b-1
            i = mod(pmod * j1 + j2, b)
            nextms[1+i] = (nextms[1+i] + ms1[1+j1] * ms2[1+j2]) % d
        end
    end
    nextms
end

function rmods(n, b, cs, ms)
    n == 1 && return ms
    m, r = divrem(n, 2)
    mct = rmods(m, b, cs, ms)
    mct = conv(m, b, mct, mct)
    if r == 1
        mct = conv(1, b, mct, ms)
    end
    mct
end

function rdigits(n, b, cs)
    ms = zeros(Int64, b)
    for c in cs
        ms[1+c%b] += 1
    end
    first(rmods(n, b, cs, ms))
end

function main()
    n, b, k = parse.(Int64, split(readline()))
    cs = parse.(Int64, split(readline()))
    println(rdigits(n, b, cs))
end

main()
