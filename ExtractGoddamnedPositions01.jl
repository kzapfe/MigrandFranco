function ExtractGoddamnedPositions01(mergas::String)
    turegexp=r"([0-9]{2})_([0-9]{2})"
    parapa=match(turegexp,mergas)
    perepe=match(turegexp,mergas,parapa.offset+5)
    parte1=int(parapa.captures)
    parte2=int(perepe.captures)
    return (parte1, parte2)
end

function limpiaarraystring(x::String)
    result=int(parse(x).args)
    return result
end
    
