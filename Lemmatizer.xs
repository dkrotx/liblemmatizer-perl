#ifdef __cplusplus
extern "C" {
#endif

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#ifdef __cplusplus
}
#endif

#include "ppport.h"

/*  undef conflicting perl macroses */
#ifdef Copy
#  undef Copy
#endif

#ifdef do_close
#   undef do_close
#endif

#ifdef do_open
#   undef do_open
#endif

#define STRLEN(s) (sizeof(s) - 1)

#include "LemInterface.hpp"

class LemmatizerAgent {
private:
    LemInterface lem_;

public:
    LemmatizerAgent() : lem_(true /* utf8 */) { }
    bool Lemmatize(const std::string &word, LemInterface::result_t *res, int flags) {
        return lem_.Lemmatize(word, res, flags);
    }
};

MODULE = Lemmatizer		PACKAGE = Lemmatizer		

LemmatizerAgent *
LemmatizerAgent::new()


void
LemmatizerAgent::DESTROY()

void
LemmatizerAgent::FirstForm(const char *word)
INIT:
PPCODE:
    LemInterface::result_t res;
    if (THIS->Lemmatize(word, &res, 0)) {
        PUSHs( sv_2mortal(newSVpv(res.first_form.c_str(), 0)) );
    }


void
LemmatizerAgent::Lemmatize(const char *word, int flags = 0)
INIT:
PPCODE:
    HV *ph;
    SV *pfirst_form;
    SV *pspeech_part;
    LemInterface::result_t res;

    if (THIS->Lemmatize(word, &res, flags)) {
        ph = newHV();

        pfirst_form = newSVpvn(res.first_form.c_str(), res.first_form.length()) ;
        hv_store(ph, "first_form", STRLEN("first_form"), pfirst_form, 0);

        if (flags & LemInterface::FILL_PART_OF_SPEECH) {
            pspeech_part = newSVpvn(res.part_of_speech.c_str(), res.part_of_speech.length());
            hv_store(ph, "part_of_speech", STRLEN("part_of_speech"), pspeech_part, 0);
        }

        XPUSHs( newRV_noinc((SV*)ph) );
    }
