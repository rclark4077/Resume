using System.Collections;
using Resume.DAL.Interfaces;
using Resume.Services.Interfaces;

namespace Resume.Services.Repositories
{
    public class EducationService : IEducationService
    {
        IEducationRepository _iEducationRepository;

        public EducationService(IEducationRepository iEducationRepository)
        {
            _iEducationRepository = iEducationRepository;
        }

        public IEnumerable GetEducation(int id = 1)
        {
            return _iEducationRepository.GetEducation(id);
        }
    }
}
