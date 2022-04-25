using Printf

function main()
    n = parse.(Int, readline())
    n ≥ 42 && (n += 1)
    @printf "AGC%03i" n
end

main()
