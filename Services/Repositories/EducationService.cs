using Resume.DAL.Interfaces;
using Resume.Services.Interfaces;
using System.Collections;

namespace Resume.Services.Repositories
{
    public class EducationService : IEducationService
    {
        IEducationRepository _iEducationRepository;

        public EducationService(IEducationRepository iEducationRepository)
        {
            _iEducationRepository = iEducationRepository;
        }

        public IEnumerable GetEducation(int id)
        {
            return _iEducationRepository.GetEducation(id);
        }
    }
}
